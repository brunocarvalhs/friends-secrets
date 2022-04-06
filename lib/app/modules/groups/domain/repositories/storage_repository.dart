import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';

abstract class StorageRepository {
  Future<Either<Failure, String>> uploadFile(File group);
}
