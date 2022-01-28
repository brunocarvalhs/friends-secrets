import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/login/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/login/domain/repositories/register_repository.dart';

abstract class ValidationPhone {
  Future<Either<Failure, void>> call(String code);
}

class ValidationPhoneImpl extends ValidationPhone {
  final RegisterRepository repository;

  ValidationPhoneImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(String code) async {
    return await repository.validation(code);
  }
}
