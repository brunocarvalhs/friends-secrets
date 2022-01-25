import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';

abstract class RegisterRepository {
  Future<Either<Failure, List<String>>> register(String phone);
  Future<Either<Failure, bool>> validation(String code);
}
