import 'package:dartz/dartz.dart';

import '../../domain/errors/errors.dart';
import '../repositories/groups_repository.dart';
import '../entities/logged_group_info.dart';

abstract class GetGroups {
  Future<Either<Failure, Iterable<LoggedGroupInfo>>> call();
}

class GetGroupsImpl extends GetGroups {
  final GroupsRepository repository;

  GetGroupsImpl(this.repository);

  @override
  Future<Either<Failure, Iterable<LoggedGroupInfo>>> call() async {
    return await repository.selectAll();
  }
}
