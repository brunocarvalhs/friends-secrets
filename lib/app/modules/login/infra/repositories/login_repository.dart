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
    } catch (e) {
      return Left(ErrorGetLoggedUser(message: "Error ao tentar recuperar usuario atual logado"));
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
    } catch (e) {
      return Left(ErrorLogin(message: "Error login with Email"));
    }
  }
}
