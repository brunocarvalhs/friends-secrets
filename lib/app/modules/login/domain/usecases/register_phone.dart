import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/login/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/login/domain/repositories/register_repository.dart';

abstract class RegisterPhone {
  Future<Either<Failure, void>> call(String phone);
}

class RegisterPhoneImpl extends RegisterPhone {
  final RegisterRepository repository;

  RegisterPhoneImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(String phone) async {
    return await repository.register(phone);
  }
}
