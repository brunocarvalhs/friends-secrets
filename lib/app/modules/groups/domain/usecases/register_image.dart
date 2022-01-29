import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/storage_repository.dart';

abstract class RegisterImage {
  Future<Either<Failure, String>> call(File group);
}

class RegisterImageImpl extends RegisterImage {
  final StorageRepository repository;

  RegisterImageImpl(this.repository);

  @override
  Future<Either<Failure, String>> call(File group) async {
    return await repository.uploadFile(group);
  }
}
