import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/contacts_repository.dart';
import 'package:friends_secrets/app/modules/groups/infra/datasource/contacts_datasource.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
import 'package:permission_handler/permission_handler.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  final NetworkDataSource datasource;
  final ContactsDataSource contactsDataSource;

  ContactsRepositoryImpl(this.datasource, this.contactsDataSource);

  @override
  Future<Either<Failure, List<dynamic>>> all(List<String> list) async {
    try {
      final params = {"contacts": list};
      final response = await datasource.post<List<dynamic>>(
        "/user/contacts",
        data: params,
        options: datasource.buildCache(),
      );
      final contacts =
          response.data?.map((e) => UserModel.fromMap(e)).toList() ?? [];
      return Right(contacts);
    } catch (e) {
      return Left(ErrorCreate(message: "Error ao tentar criar Groupo"));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getContacts() async {
    try {
      if (await Permission.contacts.request().isDenied) throw ErrorCreate();

      final result = await contactsDataSource.getContacts();
      final list = result
          .map((e) => e.phones
              .map((e) => e.number.replaceAll(RegExp(r"/(?<!^)\+|[^\d+]+"), ""))
              .toList())
          .toList();
      List<String> phones = [];
      for (var contact in list) {
        for (var number in contact) {
          phones.add(number);
        }
      }
      return Right(phones);
    } catch (e) {
      return Left(ErrorCreate());
    }
  }
}
