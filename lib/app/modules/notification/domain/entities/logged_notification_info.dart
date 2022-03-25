abstract class LoggedNotificationInfo {
  String get id;
  String? get title;
  String? get body;
  String? get image;
  bool get isVisualized;
  DateTime? get created;
  DateTime? get updated;

  Map<String, dynamic> toMap();
  String toJson();
  LoggedNotificationInfo copyWith({
    String? title,
    String? body,
    String? image,
    DateTime? created,
    DateTime? updated,
    bool? isVisualized,
  });
}
