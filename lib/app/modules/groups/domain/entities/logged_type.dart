import 'package:equatable/equatable.dart';

class LoggedType extends Equatable {
  final String? id;
  final String? name;
  final String? description;
  final String? image;
  final bool? isDrawName;
  final String? created;
  final String? updated;

  const LoggedType({
    required this.id,
    required this.name,
    required this.description,
    this.image,
    required this.isDrawName,
    required this.created,
    required this.updated,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        isDrawName,
        created,
        updated,
      ];
}
