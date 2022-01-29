import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/contacts_repository.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  final NetworkDataSource datasource;

  ContactsRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<dynamic>>> all(List<String> list) async {
    try {
      final params = {"contacts": list};
      final response = await datasource.post<List<dynamic>>("/contacts", data: params);
      final contacts = response.data?.map((e) => UserModel.fromMap(e)).toList() ?? [];
      return Right(contacts);
    } catch (e) {
      return Left(ErrorCreate(message: "Error ao tentar criar Groupo"));
    }
  }
}
