import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';

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
      _exception(e);
      return Left(ErrorGetLoggedUser(
        message: "Error ao tentar validar código",
      ));
    }
  }

  @override
  Future<Either<Failure, String?>> validation(String phone) async {
    try {
      var register = await dataSource.validation(phone);
      return Right(register);
    } catch (e) {
      _exception(e);
      return Left(ErrorGetLoggedUser(
        message: "Error ao tentar registrar seu número",
      ));
    }
  }

  void _exception(exception) {
    if (Modular.get<FirebaseCrashlytics>().isCrashlyticsCollectionEnabled) {
      Modular.get<FirebaseCrashlytics>().setCustomKey("Exception", exception.toString());
      Modular.get<FirebaseCrashlytics>().setUserIdentifier("${Modular.get<AuthStore>().user?.id}");
    }
  }
}
