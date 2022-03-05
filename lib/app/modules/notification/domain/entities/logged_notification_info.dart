abstract class LoggedNotificationInfo {
  String? get id;
  String? get name;
  String? get description;
  Map<String, dynamic> toMap();
  String toJson();
  LoggedNotificationInfo copyWith({
    String? id,
    String? name,
    String? description,
  });
}
