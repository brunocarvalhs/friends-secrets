import 'package:equatable/equatable.dart';

import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';

class LoggedGroup extends Equatable {
  final String? uuid;
  final TypeModel? type;
  final String? name;
  final String? describle;
  final String? date;
  final String? priceMin;
  final String? priceMax;
  final List<UserModel>? members;
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
    required this.members,
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
        members,
        created,
        updated,
      ];
}
