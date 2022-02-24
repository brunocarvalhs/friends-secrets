import 'dart:convert';

import 'package:friends_secrets/app/modules/login/domain/entities/logged_user.dart';
import 'package:friends_secrets/app/modules/login/domain/entities/logged_user_info.dart';

class UserModel extends LoggedUser implements LoggedUserInfo {
  const UserModel({
    required String id,
    String? name,
    String? email,
    String? photoUrl,
    String? phone,
  }) : super(
    id: id,
          name: name,
          email: email,
          photoUrl: photoUrl,
          phone: phone,
        );

  @override
  UserModel copyWith({
    String? email,
    String? name,
    String? photoUrl,
    String? phone,
  }) {
    return UserModel(
      id: id,
      email: email ?? this.email,
      name: name ?? this.name,
      photoUrl: photoUrl ?? this.photoUrl,
      phone: phone ?? this.phone,
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
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String?,
      name: map['name'] as String?,
      photoUrl: map['photoUrl'] as String?,
      phone: map['phone'] as String?,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
