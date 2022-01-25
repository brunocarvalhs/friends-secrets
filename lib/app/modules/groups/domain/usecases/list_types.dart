import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/entities/logged_type_info.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/type_repository.dart';

import '../../domain/errors/errors.dart';

abstract class ListTypes {
  Future<Either<Failure, Iterable<LoggedTypeInfo>>> call();
}

class ListTypesImpl extends ListTypes {
  final TypesRepository repository;

  ListTypesImpl(this.repository);

  @override
  Future<Either<Failure, Iterable<LoggedTypeInfo>>> call() async {
    return await repository.all();
  }
}
