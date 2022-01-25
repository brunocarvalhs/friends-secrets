import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/contacts_repository.dart';
import 'package:friends_secrets/app/modules/groups/infra/datasource/contacts_datasource.dart';

class ContactsRepositoryImpl extends ContactsRepository {
  final ContactsDataSource datasource;

  ContactsRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<dynamic>>> all() async {
    try {
      var contacts = await datasource.get();
      return Right(contacts);
    } catch (e) {
      return Left(ErrorCreate(message: "Error ao tentar criar Groupo"));
    }
  }
}
