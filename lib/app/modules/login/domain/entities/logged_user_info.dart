abstract class LoggedUserInfo {
  String get id;
  String? get name;
  String? get email;
  String? get photoUrl;
  String? get phone;

  Map<String, dynamic> toMap();
  String toJson();
  LoggedUserInfo copyWith({
    String? email,
    String? name,
    String? photoUrl,
    String? phone,
  });
}
