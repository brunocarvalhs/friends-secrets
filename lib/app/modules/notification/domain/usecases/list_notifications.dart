import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/notification/domain/entities/logged_notification_info.dart';
import 'package:friends_secrets/app/modules/notification/domain/repositories/notification_repository.dart';

import '../../domain/errors/errors.dart';

abstract class ListNotifiactions {
  Future<Either<Failure, Iterable<LoggedNotificationInfo>>> call();
}

class ListNotifiactionsImpl extends ListNotifiactions {
  final NotificationRepository repository;

  ListNotifiactionsImpl(this.repository);

  @override
  Future<Either<Failure, Iterable<LoggedNotificationInfo>>> call() async {
    return await repository.all();
  }
}
