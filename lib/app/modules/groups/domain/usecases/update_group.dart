import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/entities/logged_group_info.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/groups_repository.dart';

abstract class UpdateGroup {
  Future<Either<Failure, void>> call(String id, LoggedGroupInfo group);
}

class UpdateGroupImpl extends UpdateGroup {
  final GroupsRepository repository;

  UpdateGroupImpl(this.repository);

  @override
  Future<Either<Failure, void>> call(String id, LoggedGroupInfo group) async {
    return await repository.update(id, group);
  }
}
