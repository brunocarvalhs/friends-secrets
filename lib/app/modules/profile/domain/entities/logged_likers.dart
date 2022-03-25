import 'package:equatable/equatable.dart';

class LoggedLikers extends Equatable {
  final String id;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LoggedLikers({
    required this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props => [id];
}
