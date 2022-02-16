import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/login/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/login/domain/repositories/register_repository.dart';

abstract class ValidationPhone {
  Future<Either<Failure, String?>> call(String phone);
}

class ValidationPhoneImpl extends ValidationPhone {
  final RegisterRepository repository;

  ValidationPhoneImpl(this.repository);

  @override
  Future<Either<Failure, String?>> call(String phone) async {
    return await repository.validation(phone);
  }
}
