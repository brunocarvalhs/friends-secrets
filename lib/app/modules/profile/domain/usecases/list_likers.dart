import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/profile/domain/repositories/likers_repository.dart';

import '../../domain/errors/errors.dart';

abstract class ListLikers {
  Future<Either<Failure, Iterable<dynamic>>> call();
}

class ListLikersImpl extends ListLikers {
  final LikersRepository repository;

  ListLikersImpl(this.repository);

  @override
  Future<Either<Failure, Iterable<dynamic>>> call() async {
    return await repository.all();
  }
}
