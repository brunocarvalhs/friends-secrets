import 'package:dartz/dartz.dart';

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
    } on ConnectError catch (_) {
      return Left(ConnectError(
        title: "Conexão",
        message: "Erro ao tentar conectar ao servidor, verifique sua conexão de internet.",
      ));
    } on ServerConnectError catch (_) {
      return Left(ServerConnectError(
        title: "Servidor",
        message: "Erro ao tentar conectar ao servidor, caso o erro persista, entre em contato ao suporte.",
      ));
    } catch (e) {
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
      return Left(ErrorLogout(message: "Error ao tentar fazer logout"));
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> login() async {
    try {
      var user = await dataSource.login();
      return Right(user);
    } on ErrorLogin catch (_) {
      return Left(ErrorLogin(
        title: "Social Autenticação",
        message: "Error ao tentar recuperar usuario via social autenticação",
      ));
    } on ServerConnectError catch (_) {
      return Left(ServerConnectError(
        title: "Servidor",
        message: "Erro ao tentar conectar ao servidor, caso o erro persista, entre em contato ao suporte.",
      ));
    } on ConnectError catch (_) {
      return Left(ConnectError(
        title: "Conexão",
        message: "Erro ao tentar conectar ao servidor, verifique sua conexão de internet.",
      ));
    } catch (e) {
      return Left(ErrorGetLoggedUser(
        message: "Error ao tentar recuperar usuario atual logado",
      ));
    }
  }
}
