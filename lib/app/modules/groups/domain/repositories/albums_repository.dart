import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';

abstract class AlbumsRepository {
  Future<Either<Failure, File?>> album();
}
