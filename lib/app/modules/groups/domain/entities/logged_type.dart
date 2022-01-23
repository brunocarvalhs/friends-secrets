import 'package:equatable/equatable.dart';

class LoggedType extends Equatable {
  final String? uuid;
  final String? name;
  final String? describle;
  final bool? isDrawName;
  final String? created;
  final String? updated;

  const LoggedType({
    required this.uuid,
    required this.name,
    required this.describle,
    required this.isDrawName,
    required this.created,
    required this.updated,
  });

  @override
  List<Object?> get props => [
        uuid,
        name,
        describle,
        isDrawName,
        created,
        updated,
      ];
}
