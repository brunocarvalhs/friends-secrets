import 'package:equatable/equatable.dart';

class LoggedNotification extends Equatable {
  final String id;
  final String? title;
  final String? body;
  final String? image;
  final bool isVisualized;
  final DateTime? created;
  final DateTime? updated;

  const LoggedNotification({
    required this.id,
    this.title,
    this.body,
    this.image,
    this.created,
    this.updated,
    this.isVisualized = false,
  });

  @override
  List<Object?> get props => [id];
}
