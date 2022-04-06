import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/notification/domain/entities/logged_notification_info.dart';

import '../../domain/errors/errors.dart';

abstract class NotificationRepository {
  Future<Either<Failure, Iterable<LoggedNotificationInfo>>> all();
  Future<Either<Failure, bool>> remove(String id);
}
