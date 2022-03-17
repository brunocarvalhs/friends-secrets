import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/contacts_repository.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  final NetworkDataSource datasource;

  ContactsRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<dynamic>>> all(List<String> list) async {
    try {
      final params = {"contacts": list};
      final response = await datasource.post<List<dynamic>>(
        "/user/contacts",
        data: params,
        options: datasource.buildCache(),
      );
      final contacts = response.data?.map((e) => UserModel.fromMap(e)).toList() ?? [];
      return Right(contacts);
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
