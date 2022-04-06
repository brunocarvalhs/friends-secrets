import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';

abstract class RegisterRepository {
  Future<Either<Failure, String?>> validation(String phone);
  Future<Either<Failure, bool>> register(String verificationId, String code);
}
