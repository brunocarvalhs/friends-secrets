import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';

abstract class RegisterRepository {
  Future<Either<Failure, Map<String, dynamic>>> register(String phone);
  Future<Either<Failure, bool>> validation(String code);
}
