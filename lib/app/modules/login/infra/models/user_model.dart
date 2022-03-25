import 'dart:convert';

import 'package:friends_secrets/app/modules/login/domain/entities/logged_user.dart';
import 'package:friends_secrets/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:friends_secrets/app/modules/profile/domain/entities/logged_likers_info.dart';
import 'package:friends_secrets/app/modules/profile/infra/models/likers_model.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  const UserModel({
    required String id,
    String? name,
    String? email,
    String? photoUrl,
    String? phone,
    List<LoggedLikersInfo>? likers,
    int? notifications,
    DateTime? created,
    DateTime? updated,
  }) : super(
          id: id,
          name: name,
          email: email,
          photoUrl: photoUrl,
          phone: phone,
          likers: likers,
          notifications: notifications,
          created: created,
          updated: updated,
        );

  @override
  UserModel copyWith({
    String? email,
    String? name,
    String? photoUrl,
    String? phone,
    List<LoggedLikersInfo>? likers,
    int? notifications,
  }) {
    return UserModel(
      id: id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      phone: phone ?? this.phone,
      likers: likers ?? this.likers,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'photoUrl': photoUrl,
      'phone': phone,
      'items': likers?.map((x) => x.toMap()).toList(),
      'createdAt': created?.toIso8601String(),
      'updatedAt': updated?.toIso8601String(),
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String?,
      name: map['name'] as String?,
      photoUrl: map['photoUrl'] as String?,
      phone: map['phone'] as String?,
      notifications: map['notifications'] as int?,
      likers: map['items'] != null
          ? List<LikersModel>.from(
              map['items']?.map((x) => LikersModel.fromMap(x)))
          : null,
      created: map["createdAt"] != null
          ? DateTime.parse(map["createdAt"] as String)
          : null,
      updated: map["updatedAt"] != null
          ? DateTime.parse(map["updatedAt"] as String)
          : null,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
