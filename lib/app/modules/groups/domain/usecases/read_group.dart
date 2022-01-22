import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/entities/logged_group_info.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/groups_repository.dart';

import '../../domain/errors/errors.dart';

abstract class ReadGroup {
  Future<Either<Failure, LoggedGroupInfo>> call(String id);
}

class ReadGroupImpl extends ReadGroup {
  final GroupsRepository repository;

  ReadGroupImpl(this.repository);

  @override
  Future<Either<Failure, LoggedGroupInfo>> call(String id) async {
    return await repository.select(id);
  }
}
