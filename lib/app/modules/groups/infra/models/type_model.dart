import 'dart:convert';

import '../../domain/entities/logged_type.dart';
import '../../domain/entities/logged_type_info.dart';

class TypeModel extends LoggedType implements LoggedTypeInfo {
  const TypeModel({
    required String? uuid,
    required String? name,
    required String? describle,
    required String? isDrawName,
    required String? created,
    required String? updated,
  }) : super(
          uuid: uuid,
          name: name,
          describle: describle,
          isDrawName: isDrawName,
          created: created,
          updated: updated,
        );

  @override
  TypeModel copyWith({
    String? name,
    String? describle,
    String? isDrawName,
  }) {
    return TypeModel(
      uuid: uuid,
      name: name ?? this.name,
      describle: describle ?? this.describle,
      isDrawName: isDrawName ?? this.isDrawName,
      created: created,
      updated: updated,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "uuid": uuid,
      "name": name,
      "describle": describle,
      "isDrawName": isDrawName,
      "created": created,
      "updated": updated,
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
      uuid: map["uuid"] as String,
      name: map["name"] as String,
      describle: map["describle"] as String,
      isDrawName: map["isDrawName"] as String,
      created: map["created"] as String,
      updated: map["updated"] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory TypeModel.fromJson(String source) => TypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
