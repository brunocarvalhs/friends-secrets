import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/entities/logged_user_info.dart';
import '../../domain/repositories/login_repository.dart';

abstract class LoginWithGoogle {
  Future<Either<Failure, LoggedUserInfo>> call();
}

class LoginWithGoogleImpl extends LoginWithGoogle {
  final LoginRepository repository;

  LoginWithGoogleImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await repository.login();
  }
}
