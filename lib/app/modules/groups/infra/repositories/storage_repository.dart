
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
//     } catch (_) {
//       return Left(ErrorCreate(message: "Error ao tentar criar Groupo"));
//     }
//   }
// }
