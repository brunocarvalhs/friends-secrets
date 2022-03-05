import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/notification/domain/repositories/notification_repository.dart';
import '../../domain/errors/errors.dart';

abstract class DeleteGroup {
  Future<Either<Failure, bool>> call(String id);
}

class DeleteGroupImpl extends DeleteGroup {
  final NotificationRepository repository;

  DeleteGroupImpl(this.repository);

  @override
  Future<Either<Failure, bool>> call(String id) async {
    return await repository.remove(id);
  }
}
