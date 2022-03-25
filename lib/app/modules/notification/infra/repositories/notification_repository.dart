import 'package:dartz/dartz.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:friends_secrets/app/modules/notification/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/notification/domain/entities/logged_notification_info.dart';
import 'package:friends_secrets/app/modules/notification/domain/repositories/notification_repository.dart';
import 'package:friends_secrets/app/modules/notification/infra/models/notification_model.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final NetworkDataSource datasource;
  final AuthStore authStore;

  NotificationRepositoryImpl(this.datasource, this.authStore);

  @override
  Future<Either<Failure, bool>> remove(String id) async {
    try {
      final result = await datasource.delete("/notification");
      return Right(result.statusCode == 200);
    } catch (e) {
      return Left(ErrorNotificationDelete());
    }
  }

  @override
  Future<Either<Failure, Iterable<LoggedNotificationInfo>>> all() async {
    try {
      final response = await datasource.get<List<dynamic>>(
        "/notification",
        options: datasource.buildCache(forceRefresh: true),
      );
      final notifications =
          response.data?.map((e) => NotificationModel.fromMap(e)) ?? [];
      return Right(notifications);
    } catch (e) {
      return Left(ErrorNotificationSelectAll());
    }
  }
}
