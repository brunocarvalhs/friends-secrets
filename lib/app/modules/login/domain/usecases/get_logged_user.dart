import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/entities/logged_user_info.dart';
import '../../domain/repositories/login_repository.dart';

abstract class GetLoggedUser {
  Future<Either<Failure, LoggedUserInfo>> call();
}

class GetLoggedUserImpl extends GetLoggedUser {
  final LoginRepository repository;

  GetLoggedUserImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call() async {
    return await repository.loggedUser();
  }
}
