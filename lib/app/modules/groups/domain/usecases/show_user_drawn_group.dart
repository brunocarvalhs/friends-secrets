import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/groups_repository.dart';
import 'package:friends_secrets/app/modules/login/domain/entities/logged_user_info.dart';

import '../../domain/errors/errors.dart';

abstract class ShowUserDrawnGroup {
  Future<Either<Failure, LoggedUserInfo>> call(String id);
}

class ShowUserDrawnGroupImpl extends ShowUserDrawnGroup {
  final GroupsRepository repository;

  ShowUserDrawnGroupImpl(this.repository);

  @override
  Future<Either<Failure, LoggedUserInfo>> call(String id) async {
    return await repository.userDrawn(id);
  }
}
