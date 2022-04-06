import 'dart:io';

abstract class StorageDatasource {
  Future<dynamic> uploadFile(String? ref, File file);
}
