import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/profile/domain/entities/logged_likers_info.dart';
import 'package:friends_secrets/app/modules/profile/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/profile/domain/repositories/likers_repository.dart';

abstract class SaveListLikes {
  Future<Either<Failure, bool>> call(List<LoggedLikersInfo> listLikes);
}

class SaveListLikesImpl extends SaveListLikes {
  final LikersRepository repository;

  SaveListLikesImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(List<LoggedLikersInfo> listLikes) async {
    return await repository.save(listLikes);
  }
}
