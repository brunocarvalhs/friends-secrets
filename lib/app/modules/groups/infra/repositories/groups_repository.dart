import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/entities/logged_group_info.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/groups_repository.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:dartz/dartz.dart';

class GroupsRepositoryImpl extends GroupsRepository {
  final NetworkDataSource datasource;
  final AuthStore authStore;

  GroupsRepositoryImpl(this.datasource, this.authStore);

  @override
  Future<Either<Failure, LoggedGroupInfo>> create(LoggedGroupInfo group) async {
    try {
      final response = await datasource.post("/group", data: group.toMap());
      final create = GroupModel.fromMap(response.data);
      return Right(create);
    } catch (e) {
      return Left(ErrorCreate(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> exit(String id) async {
    try {
      return const Right(true);
    } catch (e) {
      return Left(ErrorRemove());
    }
  }

  @override
  Future<Either<Failure, bool>> remove(String id) async {
    try {
      final result = await datasource.delete("/group");
      return Right(result.statusCode == 200);
    } catch (e) {
      return Left(ErrorRemove());
    }
  }

  @override
  Future<Either<Failure, LoggedGroupInfo>> select(String id) async {
    try {
      final response = await datasource.get("/group/$id");
      final group = GroupModel.fromMap(response.data);
      return Right(group);
    } catch (e) {
      return Left(ErrorSelect());
    }
  }

  @override
  Future<Either<Failure, Iterable<LoggedGroupInfo>>> selectAll() async {
    try {
      final response = await datasource.get<List<dynamic>>("/group");
      final groups = response.data?.map((e) => GroupModel.fromMap(e)) ?? [];
      return Right(groups);
    } catch (e) {
      return Left(ErrorSelectAll());
    }
  }

  @override
  Future<Either<Failure, LoggedGroupInfo>> update(LoggedGroupInfo group) async {
    try {
      final response = await datasource.put("/group", data: group.toMap());
      return Right(response.data);
    } catch (e) {
      return Left(ErrorUpdate());
    }
  }
}
