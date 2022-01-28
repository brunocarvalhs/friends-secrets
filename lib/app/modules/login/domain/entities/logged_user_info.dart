abstract class LoggedUserInfo {
  String get uuid;
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
