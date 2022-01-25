import 'dart:developer';

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
  Future<Either<Failure, LoggedGroupInfo>> create(LoggedGroupInfo groups) async {
    try {
      final group = GroupModel(uuid: "", name: "", created: "", updated: "");
      return Right(group);
    } catch (e) {
      return Left(ErrorCreate());
    }
  }

  @override
  Future<Either<Failure, bool>> exit(String id) async {
    try {
      final response = await datasource.get("/group");
      return const Right(true);
    } catch (e) {
      return Left(ErrorRemove());
    }
  }

  @override
  Future<Either<Failure, bool>> remove(String id) async {
    try {
      final response = await datasource.get("/group");
      return const Right(true);
    } catch (e) {
      return Left(ErrorRemove());
    }
  }

  @override
  Future<Either<Failure, LoggedGroupInfo>> select(String id) async {
    try {
      final group = GroupModel(uuid: "", name: "", created: "", updated: "");
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
  Future<Either<Failure, LoggedGroupInfo>> update(LoggedGroupInfo groups) async {
    try {
      final response = await datasource.get("/group");
      final group = GroupModel(uuid: "", name: "", created: "", updated: "");

      return Right(group);
    } catch (e) {
      return Left(ErrorUpdate());
    }
  }
}
