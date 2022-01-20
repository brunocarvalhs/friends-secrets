import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../../domain/repositories/login_repository.dart';

abstract class Logout {
  Future<Either<Failure, Unit>> call();
}

class LogoutImpl extends Logout {
  final LoginRepository repository;

  LogoutImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call() async {
    return await repository.logout();
  }
}
