import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/entities/logged_group_info.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/groups_repository.dart';

abstract class RegistersGroup {
  Future<Either<Failure, LoggedGroupInfo>> call(LoggedGroupInfo Group);
}

class RegisterGroupImpl extends RegistersGroup {
  final GroupsRepository repository;

  RegisterGroupImpl(this.repository);

  @override
  Future<Either<Failure, LoggedGroupInfo>> call(LoggedGroupInfo Group) async {
    return await repository.create(Group);
  }
}
