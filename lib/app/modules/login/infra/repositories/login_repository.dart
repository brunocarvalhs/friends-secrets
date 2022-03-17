import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';

import '../../domain/repositories/login_repository.dart';
import '../../domain/errors/errors.dart';
import '../../domain/entities/logged_user_info.dart';
import '../../infra/datasource/login_data_source.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginDataSource dataSource;

  LoginRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, LoggedUserInfo>> loggedUser() async {
    try {
      var user = await dataSource.currentUser();
      return Right(user);
    } on ConnectError catch (e) {
      _exception(e);
      return Left(ConnectError(
        title: "Conexão",
        message: "Erro ao tentar conectar ao servidor, verifique sua conexão de internet.",
      ));
    } on ServerConnectError catch (e) {
      _exception(e);
      return Left(ServerConnectError(
        title: "Servidor",
        message: "Erro ao tentar conectar ao servidor, caso o erro persista, entre em contato ao suporte.",
      ));
    } catch (e) {
      _exception(e);
      return Left(ErrorGetLoggedUser(
        title: "Usuário",
        message: "Error ao tentar recuperar usuario atual logado",
      ));
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    try {
      await dataSource.logout();
      return const Right(unit);
    } catch (e) {
      _exception(e);
      return Left(ErrorLogout(message: "Error ao tentar fazer logout"));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> login() async {
    try {
      var user = await dataSource.login();
      return Right(user);
    } on ErrorLogin catch (e) {
      _exception(e);
      return Left(ErrorLogin(
        title: "Social Autenticação",
        message: "Error ao tentar recuperar usuario via social autenticação",
      ));
    } on ServerConnectError catch (e) {
      _exception(e);
      return Left(ServerConnectError(
        title: "Servidor",
        message: "Erro ao tentar conectar ao servidor, caso o erro persista, entre em contato ao suporte.",
      ));
    } on ConnectError catch (e) {
      _exception(e);
      return Left(ConnectError(
        title: "Conexão",
        message: "Erro ao tentar conectar ao servidor, verifique sua conexão de internet.",
      ));
    } catch (e) {
      _exception(e);
      return Left(ErrorGetLoggedUser(
        message: "Error ao tentar recuperar usuario atual logado",
      ));
    }
  }

  void _exception(exception) {
    if (Modular.get<FirebaseCrashlytics>().isCrashlyticsCollectionEnabled) {
      Modular.get<FirebaseCrashlytics>().setCustomKey("Exception", exception.toString());
      Modular.get<FirebaseCrashlytics>().setUserIdentifier("${Modular.get<AuthStore>().user?.id}");
    }
  }
}
