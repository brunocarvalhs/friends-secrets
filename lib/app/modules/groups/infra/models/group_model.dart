import 'dart:convert';

import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';

import '../../domain/entities/logged_group.dart';
import '../../domain/entities/logged_group_info.dart';

class GroupModel extends LoggedGroup implements LoggedGroupInfo {
  const GroupModel({
    String? uuid,
    TypeModel? type,
    String? name,
    String? describle,
    String? date,
    String? priceMin,
    String? priceMax,
    List<UserModel>? members,
    String? created,
    String? updated,
  }) : super(
          uuid: uuid,
          type: type,
          name: name,
          describle: describle,
          date: date,
          priceMin: priceMin,
          priceMax: priceMax,
          members: members,
          created: created,
          updated: updated,
        );

  @override
  GroupModel copyWith({
    String? uuid,
    TypeModel? type,
    String? name,
    String? describle,
    String? date,
    String? priceMin,
    String? priceMax,
    List<UserModel>? members,
    String? created,
    String? updated,
  }) {
    return GroupModel(
      uuid: uuid ?? this.uuid,
      type: type ?? this.type,
      name: name ?? this.name,
      describle: describle ?? this.describle,
      date: date ?? this.date,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      members: members ?? this.members,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "uuid": uuid,
      "type": type?.toMap(),
      "name": name,
      "describle": describle,
      "date": date,
      "priceMin": priceMin,
      "priceMax": priceMax,
      'members': members?.map((x) => x.toMap()).toList(),
      "created": created,
      "updated": updated,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      uuid: map["id"] as String,
      type: map['type'] != null ? TypeModel.fromMap(map['type']) : null,
      name: map["name"] as String,
      describle: map["describle"] as String?,
      date: map["date"] as String?,
      priceMin: map["price_min"] as String?,
      priceMax: map["price_max"] as String?,
      members: map['members'] != null ? List<UserModel>.from(map['members']?.map((x) => UserModel.fromMap(x))) : null,
      created: map["created_at"] as String,
      updated: map["updated_at"] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory GroupModel.fromJson(String source) => GroupModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
