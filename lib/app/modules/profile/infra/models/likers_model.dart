import 'dart:convert';

import 'package:friends_secrets/app/modules/profile/domain/entities/logged_likers.dart';
import 'package:friends_secrets/app/modules/profile/domain/entities/logged_likers_info.dart';

class LikersModel extends LoggedLikers implements LoggedLikersInfo {
  const LikersModel({
    required String id,
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) : super(
          id: id,
          name: name,
          createdAt: createdAt,
          updatedAt: updatedAt,
        );

  @override
  LikersModel copyWith({
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LikersModel(
      id: id,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "createdAt": createdAt?.toIso8601String(),
      "updatedAt": updatedAt?.toIso8601String(),
    };
  }

  factory LikersModel.fromMap(Map<String, dynamic> map) {
    return LikersModel(
      id: map["id"] as String,
      name: map["name"] as String,
      createdAt: map["createdAt"] != null ? DateTime.parse(map["createdAt"] as String) : null,
      updatedAt: map["updatedAt"] != null ? DateTime.parse(map["updatedAt"] as String) : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory LikersModel.fromJson(String source) => LikersModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
