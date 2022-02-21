import 'dart:convert';

import '../../domain/entities/logged_type.dart';
import '../../domain/entities/logged_type_info.dart';

class TypeModel extends LoggedType implements LoggedTypeInfo {
  const TypeModel({
    required String? uuid,
    required String? name,
    required String? description,
    required bool? isDrawName,
    required String? created,
    required String? updated,
  }) : super(
          uuid: uuid,
          name: name,
          description: description,
          isDrawName: isDrawName,
          created: created,
          updated: updated,
        );

  @override
  TypeModel copyWith({
    String? name,
    String? description,
    bool? isDrawName,
  }) {
    return TypeModel(
      uuid: uuid,
      name: name ?? this.name,
      description: description ?? this.description,
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
      "description": description,
      "isDrawName": isDrawName,
      "created": created,
      "updated": updated,
    };
  }

  factory TypeModel.fromMap(Map<String, dynamic> map) {
    return TypeModel(
      uuid: map["id"] as String,
      name: map["name"] as String,
      description: map["description"] as String,
      isDrawName: map["isDrawName"] as bool,
      created: map["createdAt"] as String,
      updated: map["updatedAt"] as String,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory TypeModel.fromJson(String source) => TypeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
