import 'dart:io';

abstract class GaleryPhotoDatasource {
  Future<File?> album();
}
