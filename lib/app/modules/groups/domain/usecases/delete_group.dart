import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/groups_repository.dart';

abstract class DeleteGroup {
  Future<Either<Failure, bool>> call(String id);
}

class DeleteGroupImpl extends DeleteGroup {
  final GroupsRepository repository;

  DeleteGroupImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(String id) async {
    return await repository.remove(id);
  }
}
