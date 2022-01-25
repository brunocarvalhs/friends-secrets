import 'package:equatable/equatable.dart';

class LoggedGroup extends Equatable {
  final String? uuid;
  final Object? type;
  final String? name;
  final String? describle;
  final String? date;
  final String? priceMin;
  final String? priceMax;
  final String? created;
  final String? updated;

  const LoggedGroup({
    required this.uuid,
    required this.type,
    required this.name,
    required this.describle,
    required this.date,
    required this.priceMin,
    required this.priceMax,
    required this.created,
    required this.updated,
  });

  @override
  List<Object?> get props => [
        uuid,
        type,
        name,
        describle,
        date,
        priceMin,
        priceMax,
        created,
        updated,
      ];
}
