import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/profile/domain/repositories/likers_repository.dart';
import '../../domain/errors/errors.dart';

abstract class DeleteLikers {
  Future<Either<Failure, bool>> call(String id);
}

class DeleteLikersImpl extends DeleteLikers {
  final LikersRepository repository;

  DeleteLikersImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(String id) async {
    return await repository.remove(id);
  }
}
