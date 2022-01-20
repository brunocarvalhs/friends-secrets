import 'package:dartz/dartz.dart';

import '../../domain/entities/logged_user_info.dart';
import '../../domain/errors/errors.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoggedUserInfo>> login();
  Future<Either<Failure, LoggedUserInfo>> loggedUser();
  Future<Either<Failure, Unit>> logout();
}
