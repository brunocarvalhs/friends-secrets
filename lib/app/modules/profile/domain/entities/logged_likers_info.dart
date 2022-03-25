abstract class LoggedLikersInfo {
  String get id;
  String? get name;
  DateTime? get createdAt;
  DateTime? get updatedAt;

  Map<String, dynamic> toMap();
  String toJson();
  LoggedLikersInfo copyWith({
    String? name,
    DateTime? createdAt,
    DateTime? updatedAt,
  });
}
