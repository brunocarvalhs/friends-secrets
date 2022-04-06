import 'package:friends_secrets/app/modules/groups/domain/entities/logged_type_info.dart';

abstract class TypesDataSource {
  Future<List<LoggedTypeInfo>> selectAll();
}
