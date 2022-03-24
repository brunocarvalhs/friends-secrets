import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/profile/domain/entities/logged_likers_info.dart';
import 'package:friends_secrets/app/modules/profile/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:friends_secrets/app/modules/profile/domain/repositories/likers_repository.dart';
import 'package:friends_secrets/app/modules/profile/infra/models/likers_model.dart';

class LikersRepositoryImpl extends LikersRepository {
  final NetworkDataSource datasource;
  final AuthStore authStore;

  LikersRepositoryImpl(this.datasource, this.authStore);

  @override
  Future<Either<Failure, bool>> remove(String id) async {
    try {
      final result = await datasource.delete("/likers");
      return Right(result.statusCode == 200);
    } catch (e) {
      return Left(ErrorLikersDelete());
    }
  }

  @override
  Future<Either<Failure, Iterable<LoggedLikersInfo>>> all() async {
    try {
      final response = await datasource.get<List<dynamic>>(
        "/item",
        options: datasource.buildCache(forceRefresh: true),
      );
      final likers = response.data?.map((e) => LikersModel.fromMap(e)) ?? [];
      return Right(likers);
    } catch (e) {
      return Left(ErrorLikersSelectAll());
    }
  }

  @override
  Future<Either<Failure, bool>> save(List<LoggedLikersInfo> listLikes) async {
    try {
      final params = listLikes.map((element) => element.toMap()).toList();
      final result = await datasource.post("/user/likes", data: params);
      return Right(result.statusCode == 200);
    } catch (e) {
      return Left(ErrorLikersSave(
        title: "Salvar",
        message:
            "Erro ao tentar salvar todos os seus gostos, tente novamente e caso o erro persista pode entrar em contato com suporte.",
      ));
    }
  }
}
