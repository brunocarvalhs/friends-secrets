import 'dart:convert';

import 'package:friends_secrets/app/modules/notification/domain/entities/logged_notification.dart';
import '../../domain/entities/logged_Notification_info.dart';

class NotificationModel extends LoggedNotification implements LoggedNotificationInfo {
  const NotificationModel({
    required String id,
    String? name,
    String? description,
    DateTime? date,
    bool isNew = false,
  }) : super(
          id: id,
          name: name,
          description: description,
          date: date,
          isNew: isNew,
        );

  @override
  NotificationModel copyWith({
    String? id,
    String? name,
    String? description,
    DateTime? date,
    bool? isNew,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      date: date ?? this.date,
      isNew: isNew ?? this.isNew,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "description": description,
      "date": date?.toIso8601String(),
      "isNew": isNew,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map["id"] as String,
      name: map["name"] as String,
      description: map["description"] as String?,
      date: map["date"] != null ? DateTime.parse(map["date"] as String) : null,
      isNew: map["isNew"] as bool,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
