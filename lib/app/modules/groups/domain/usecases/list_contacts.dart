import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/contacts_repository.dart';

import '../../domain/errors/errors.dart';

abstract class ListContacts {
  Future<Either<Failure, List<dynamic>>> call(List<String> phones);
}

class ListContactsImpl extends ListContacts {
  final ContactsRepository repository;

  ListContactsImpl(this.repository);

  @override
  Future<Either<Failure, List<dynamic>>> call(List<String> phones) async {
    return await repository.all(phones);
  }
}
