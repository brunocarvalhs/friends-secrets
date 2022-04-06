import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/groups_repository.dart';

import '../../domain/errors/errors.dart';

abstract class DrawnGroup {
  Future<Either<Failure, bool>> call(String id);
}

class DrawnGroupImpl extends DrawnGroup {
  final GroupsRepository repository;

  DrawnGroupImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(String id) async {
    return await repository.drawnOfGroup(id);
  }
}
