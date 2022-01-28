import 'package:dartz/dartz.dart';

import '../../domain/repositories/register_repository.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasource/register_data_source.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDataSource dataSource;

  RegisterRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, Map<String, dynamic>>> register(String phone) async {
    try {
      var register = await dataSource.register(phone);
      return Right(register);
    } catch (e) {
      return Left(ErrorGetLoggedUser(message: "Error ao tentar registrar seu número"));
    }
  }

  @override
  Future<Either<Failure, bool>> validation(String code) async {
    try {
      await dataSource.validation(code);
      return const Right(true);
    } catch (e) {
      return Left(ErrorGetLoggedUser(message: "Error ao tentar validar código"));
    }
  }
}
