import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/login/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/login/domain/repositories/login_repository.dart';

abstract class RegisterPhone {
  Future<Either<Failure, void>> call();
}

class RegisterPhoneImpl extends RegisterPhone {
  final LoginRepository repository;

  RegisterPhoneImpl(this.repository);

  @override
  Future<Either<Failure, void>> call() async {
    return await repository.loggedUser();
  }
}
