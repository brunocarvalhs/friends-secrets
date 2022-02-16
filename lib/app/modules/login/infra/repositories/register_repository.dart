import 'package:dartz/dartz.dart';

import '../../domain/repositories/register_repository.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasource/register_data_source.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDataSource dataSource;

  RegisterRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, bool>> register(String verificationId, String code) async {
    try {
      var result = await dataSource.register(verificationId, code);
      return Right(result);
    } catch (e) {
      return Left(ErrorGetLoggedUser(message: "Error ao tentar validar código"));
    }
  }

  @override
  Future<Either<Failure, String?>> validation(String phone) async {
    try {
      var register = await dataSource.validation(phone);
      return Right(register);
    } catch (e) {
      return Left(ErrorGetLoggedUser(message: "Error ao tentar registrar seu número"));
    }
  }
}
