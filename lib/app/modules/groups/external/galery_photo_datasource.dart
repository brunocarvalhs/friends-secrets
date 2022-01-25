import 'dart:io';

import 'package:friends_secrets/app/modules/groups/infra/datasource/galery_photo_datasource.dart';
import 'package:image_picker/image_picker.dart';

class GaleryPhotoDatasourceImpl extends GaleryPhotoDatasource {
  final ImagePicker picker;

  GaleryPhotoDatasourceImpl(this.picker);

  @override
  Future<File?> album() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) return File(image.path);
  }
}
