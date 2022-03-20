import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/entities/logged_group_info.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/groups_repository.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
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
      _exception(e);
      return Left(ErrorCreate(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> exit(String id) async {
    try {
      return const Right(true);
    } catch (e) {
      _exception(e);
      return Left(ErrorRemove());
    }
  }

  @override
  Future<Either<Failure, bool>> remove(String id) async {
    try {
      final result = await datasource.delete("/group");
      return Right(result.statusCode == 200);
    } catch (e) {
      _exception(e);
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
      _exception(e);
      return Left(ErrorSelect());
    }
  }

  @override
  Future<Either<Failure, Iterable<LoggedGroupInfo>>> selectAll() async {
    try {
      final response = await datasource.get<List<dynamic>>(
        "/group",
        options: datasource.buildCache(forceRefresh: true),
      );
      final groups = response.data?.map((e) => GroupModel.fromMap(e)) ?? [];
      return Right(groups);
    } catch (e) {
      _exception(e);
      return Left(ErrorSelectAll());
    }
  }

  @override
  Future<Either<Failure, LoggedGroupInfo>> update(String id, LoggedGroupInfo group) async {
    try {
      final response = await datasource.put("/group/$id", data: group.toMap());
      final data = GroupModel.fromMap(response.data);
      return Right(data);
    } catch (e) {
      _exception(e);
      return Left(ErrorUpdate());
    }
  }

  @override
  Future<Either<Failure, bool>> drawnOfGroup(String id) async {
    try {
      final response = await datasource.post("/group/$id/drawn");
      return Right(response.statusCode == 200);
    } catch (e) {
      _exception(e);
      return Left(ErrorSelect());
    }
  }

  @override
  Future<Either<Failure, LoggedUserInfo>> userDrawn(String id) async {
    try {
      final response = await datasource.get(
        "/group/$id/drawn",
        options: datasource.buildCache(),
      );
      final group = UserModel.fromMap(response.data);
      return Right(group);
    } catch (e) {
      _exception(e);
      return Left(ErrorSelect());
    }
  }

  void _exception(exception) {
    if (Modular.get<FirebaseCrashlytics>().isCrashlyticsCollectionEnabled) {
      Modular.get<FirebaseCrashlytics>().setCustomKey("Exception", exception.toString());
      Modular.get<FirebaseCrashlytics>().setUserIdentifier("${Modular.get<AuthStore>().user?.id}");
    }
  }
}
