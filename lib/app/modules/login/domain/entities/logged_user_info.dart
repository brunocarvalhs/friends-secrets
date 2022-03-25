import 'package:friends_secrets/app/modules/profile/domain/entities/logged_likers_info.dart';

abstract class LoggedUserInfo {
  String get id;
  String? get name;
  String? get email;
  String? get photoUrl;
  String? get phone;
  DateTime? get created;
  DateTime? get updated;
  List<LoggedLikersInfo>? get likers;
  int? get notifications;

  Map<String, dynamic> toMap();
  String toJson();
  LoggedUserInfo copyWith({
    String? email,
    String? name,
    String? photoUrl,
    String? phone,
    List<LoggedLikersInfo>? likers,
    int? notifications,
  });
}
