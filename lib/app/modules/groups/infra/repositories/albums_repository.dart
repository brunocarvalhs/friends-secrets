import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/albums_repository.dart';
import 'package:friends_secrets/app/modules/groups/infra/datasource/galery_photo_datasource.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

class AlbumsRepositoryImpl extends AlbumsRepository {
  final GaleryPhotoDatasource datasource;

  AlbumsRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, File?>> album() async {
    try {
      final file = await datasource.album();
      return Right(file);
    } catch (_) {
      return Left(ErrorImageAlbum(message: "Error ao carregar imagem do album"));
    }
  }
}
