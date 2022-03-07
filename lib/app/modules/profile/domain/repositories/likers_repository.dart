import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/profile/domain/entities/logged_likers_info.dart';

import '../../domain/errors/errors.dart';

abstract class LikersRepository {
  Future<Either<Failure, Iterable<LoggedLikersInfo>>> all();
  Future<Either<Failure, bool>> remove(String id);
}
