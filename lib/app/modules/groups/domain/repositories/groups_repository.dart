import 'package:dartz/dartz.dart';

import '../entities/logged_group_info.dart';
import '../../domain/errors/errors.dart';

abstract class GroupsRepository {
  Future<Either<Failure, LoggedGroupInfo>> select(String id);
  Future<Either<Failure, Iterable<LoggedGroupInfo>>> selectAll();
  Future<Either<Failure, LoggedGroupInfo>> create(LoggedGroupInfo group);
  Future<Either<Failure, LoggedGroupInfo>> update(LoggedGroupInfo group);
  Future<Either<Failure, bool>> remove(String id);
  Future<Either<Failure, bool>> exit(String id);
}
