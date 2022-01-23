import 'package:dartz/dartz.dart';

import '../../domain/repositories/register_repository.dart';
import '../../domain/errors/errors.dart';
import '../../infra/datasource/register_data_source.dart';

class RegisterRepositoryImpl extends RegisterRepository {
  final RegisterDataSource dataSource;

  RegisterRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, List<String>>> register(String phone) async {
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
      var validation = await dataSource.validation(code);
      return Right(validation);
    } catch (e) {
      return Left(ErrorGetLoggedUser(message: "Error ao tentar validar código"));
    }
  }
}
