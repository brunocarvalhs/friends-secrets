import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/groups_repository.dart';

abstract class SharedGroup {
  Future<Either<Failure, bool>> call(String id);
}

class SharedGroupImpl extends SharedGroup {
  final GroupsRepository repository;

  SharedGroupImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(String id) async {
    return await repository.remove(id);
  }
}
