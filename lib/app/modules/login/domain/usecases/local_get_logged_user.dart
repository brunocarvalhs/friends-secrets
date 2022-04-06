import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/entities/logged_user_info.dart';
import '../../domain/repositories/login_repository.dart';

abstract class LocalGetLoggedUser {
  Future<Either<Failure, LoggedUserInfo>> call();
}

class LocalGetLoggedUserImpl extends LocalGetLoggedUser {
  final LoginRepository repository;

  LocalGetLoggedUserImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await repository.loggedUser();
  }
}
