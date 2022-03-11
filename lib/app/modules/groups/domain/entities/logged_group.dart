import 'package:equatable/equatable.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';

class LoggedGroup extends Equatable {
  final String? id;
  final TypeModel? type;
  final String? name;
  final String? description;
  final String? date;
  final double? priceMin;
  final double? priceMax;
  final UserModel? author;
  final List<UserModel>? users;
  final DateTime? created;
  final DateTime? updated;
  final bool isDrawns;

  const LoggedGroup({
    required this.id,
    required this.type,
    required this.name,
    required this.description,
    required this.date,
    required this.priceMin,
    required this.priceMax,
    required this.author,
    required this.users,
    required this.created,
    required this.updated,
    required this.isDrawns,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        date,
        priceMin,
        priceMax,
        created,
        updated,
      ];
}
