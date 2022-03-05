import 'package:equatable/equatable.dart';

class LoggedNotification extends Equatable {
  final String id;
  final String? name;
  final String? description;
  final DateTime? date;
  final bool isNew;

  const LoggedNotification({
    required this.id,
    this.name,
    this.description,
    this.date,
    this.isNew = false,
  });

  @override
  List<Object?> get props => [id];
}
