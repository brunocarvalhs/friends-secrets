import 'dart:convert';

import 'package:friends_secrets/app/modules/notification/domain/entities/logged_notification.dart';
import 'package:friends_secrets/app/modules/notification/domain/entities/logged_notification_info.dart';

class NotificationModel extends LoggedNotification
    implements LoggedNotificationInfo {
  const NotificationModel({
    required String id,
    String? title,
    String? body,
    String? image,
    DateTime? created,
    DateTime? updated,
    bool isVisualized = false,
  }) : super(
          id: id,
          title: title,
          body: body,
          image: image,
          created: created,
          updated: updated,
          isVisualized: isVisualized,
        );

  @override
  NotificationModel copyWith({
    String? title,
    String? body,
    String? image,
    DateTime? created,
    DateTime? updated,
    bool? isVisualized,
  }) {
    return NotificationModel(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
      image: image ?? this.image,
      created: created ?? this.created,
      updated: updated ?? this.updated,
      isVisualized: isVisualized ?? this.isVisualized,
    );
  }

  @override
  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "body": body,
      "image": image,
      "created": created?.toIso8601String(),
      "updated": updated?.toIso8601String(),
      "isVisualized": isVisualized,
    };
  }

  factory NotificationModel.fromMap(Map<String, dynamic> map) {
    return NotificationModel(
      id: map["id"] as String,
      title: map["title"] as String,
      body: map["body"] as String,
      image: map["image"] as String?,
      created: map["createdAt"] != null
          ? DateTime.parse(map["createdAt"] as String)
          : null,
      updated: map["updatedAt"] != null
          ? DateTime.parse(map["updatedAt"] as String)
          : null,
      isVisualized: map["isVisualized"] as bool,
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory NotificationModel.fromJson(String source) =>
      NotificationModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
