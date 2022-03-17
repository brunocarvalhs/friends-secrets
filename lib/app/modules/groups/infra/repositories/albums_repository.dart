import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/albums_repository.dart';
import 'package:friends_secrets/app/modules/groups/infra/datasource/galery_photo_datasource.dart';
import 'package:dartz/dartz.dart';
import 'dart:io';

import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';

class AlbumsRepositoryImpl extends AlbumsRepository {
  final GaleryPhotoDatasource datasource;

  AlbumsRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, File?>> album() async {
    try {
      final file = await datasource.album();
      return Right(file);
    } catch (e) {
      _exception(e);
      return Left(ErrorImageAlbum(message: "Error ao carregar imagem do album"));
    }
  }

  void _exception(exception) {
    if (Modular.get<FirebaseCrashlytics>().isCrashlyticsCollectionEnabled) {
      Modular.get<FirebaseCrashlytics>().setCustomKey("Exception", exception.toString());
      Modular.get<FirebaseCrashlytics>().setUserIdentifier("${Modular.get<AuthStore>().user?.id}");
    }
  }
}
