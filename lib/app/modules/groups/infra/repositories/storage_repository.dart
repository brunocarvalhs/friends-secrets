// class StorageRepositoryImpl extends StorageRepository {
//   final StorageDatasource datasource;
//   final String collection = "Groups";
//   final AuthStore authStore;

//   StorageRepositoryImpl(this.datasource, this.authStore);

//   @override
//   Future<Either<Failure, String>> uploadFile(File file) async {
//     try {
//       final result = await datasource.uploadFile("$collection/${authStore.user!.id}/${basename(file.path)}", file)
//           as firebase_storage.TaskSnapshot;
//       final uri = await result.ref.getDownloadURL();
//       return Right(uri);
//     } catch (e) {
// _exception(e)
//       return Left(ErrorCreate(message: "Error ao tentar criar Groupo"));
//     }
//   }

// void _exception(exception) {
//     if (Modular.get<FirebaseCrashlytics>().isCrashlyticsCollectionEnabled) {
//       Modular.get<FirebaseCrashlytics>().setCustomKey("Exception", exception.toString());
//       Modular.get<FirebaseCrashlytics>().setUserIdentifier("${Modular.get<AuthStore>().user?.id}");
//     }
//   }
// }
