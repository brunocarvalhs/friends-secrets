import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';

abstract class LoggedGroupInfo {
  String? get id;
  TypeModel? get type;
  String? get name;
  String? get description;
  DateTime? get date;
  double? get priceMin;
  double? get priceMax;
  UserModel? get author;
  List<UserModel>? get users;
  DateTime? get created;
  DateTime? get updated;
  bool get isDrawns;

  Map<String, dynamic> toMap();
  String toJson();
  LoggedGroupInfo copyWith({
    TypeModel? type,
    String? name,
    String? description,
    DateTime? date,
    UserModel? author,
    List<UserModel>? users,
    double? priceMin,
    double? priceMax,
    bool? isDrawns,
  });
}
