import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';

abstract class ContactsRepository {
  Future<Either<Failure, List<String>>> getContacts();
  Future<Either<Failure, List<dynamic>>> all(List<String> list);
}
