import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/groups/domain/entities/logged_type_info.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/type_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';

class TypesRepositoryImpl extends TypesRepository {
  final NetworkDataSource datasource;

  TypesRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, Iterable<LoggedTypeInfo>>> all() async {
    try {
      final response = await datasource.get<List<dynamic>>(
        "/type",
        options: datasource.buildCache(),
      );
      final types = response.data?.map((e) => TypeModel.fromMap(e)) ?? [];
      return Right(types);
    } catch (e) {
      _exception(e);
      return Left(ErrorCreate(message: "Error ao tentar criar Groupo"));
    }
  }

  void _exception(exception) {
    if (Modular.get<FirebaseCrashlytics>().isCrashlyticsCollectionEnabled) {
      Modular.get<FirebaseCrashlytics>().setCustomKey("Exception", exception.toString());
      Modular.get<FirebaseCrashlytics>().setUserIdentifier("${Modular.get<AuthStore>().user?.id}");
    }
  }
}
