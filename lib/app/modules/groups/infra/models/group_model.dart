import 'dart:convert';

import '../../domain/entities/logged_group.dart';
import '../../domain/entities/logged_group_info.dart';

class GroupModel extends LoggedGroup implements LoggedGroupInfo {
  const GroupModel({
    String? uuid,
    Object? type,
    String? name,
    String? describle,
    String? date,
    String? priceMin,
    String? priceMax,
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
          created: created,
          updated: updated,
        );

  @override
  GroupModel copyWith({
    Object? type,
    String? name,
    String? describle,
    String? date,
    String? priceMin,
    String? priceMax,
  }) {
    return GroupModel(
      uuid: uuid,
      type: type ?? this.type,
      name: name ?? this.name,
      describle: describle ?? this.describle,
      date: date ?? this.date,
      priceMin: priceMin ?? this.priceMin,
      priceMax: priceMax ?? this.priceMax,
      created: created,
      updated: updated,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "uuid": uuid,
      "type": type,
      "name": name,
      "describle": describle,
      "date": date,
      "priceMin": priceMin,
      "priceMax": priceMax,
      "created": created,
      "updated": updated,
    };
  }

  factory GroupModel.fromMap(Map<String, dynamic> map) {
    return GroupModel(
      uuid: map["uuid"] as String,
      // type: map["types_id"] as String?,
      name: map["name"] as String,
      describle: map["describle"] as String?,
      date: map["date"] as String?,
      priceMin: map["price_min"] as String?,
      priceMax: map["price_max"] as String?,
      created: map["created_at"] as String,
      updated: map["updated_at"] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory GroupModel.fromJson(String source) => GroupModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
