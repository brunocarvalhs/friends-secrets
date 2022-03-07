import 'package:dartz/dartz.dart';
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
      final response = await datasource.get<List<dynamic>>("/notification");
      final notifications = response.data?.map((e) => LikersModel.fromMap(e)) ?? [];
      return Right(notifications as Iterable<LoggedLikersInfo>);
    } catch (e) {
      return Left(ErrorLikersSelectAll());
    }
  }
}
