import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';

abstract class LoggedGroupInfo {
  String? get id;
  TypeModel? get type;
  String? get name;
  String? get description;
  String? get date;
  String? get priceMin;
  String? get priceMax;
  List<UserModel>? get users;
  String? get created;
  String? get updated;

  Map<String, dynamic> toMap();
  String toJson();
  LoggedGroupInfo copyWith({
    TypeModel? type,
    String? name,
    String? description,
    String? date,
    List<UserModel>? users,
    String? priceMin,
    String? priceMax,
  });
}
