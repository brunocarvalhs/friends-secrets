import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/groups_repository.dart';

abstract class ExitGroup {
  Future<Either<Failure, bool>> call(String id);
}

class ExitGroupImpl extends ExitGroup {
  final GroupsRepository repository;

  ExitGroupImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(String id) async {
    return await repository.exit(id);
  }
}
