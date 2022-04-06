import 'package:equatable/equatable.dart';
import 'package:friends_secrets/app/modules/profile/domain/entities/logged_likers_info.dart';

class LoggedUser extends Equatable {
  final String id;
  final String? email;
  final String? name;
  final String? photoUrl;
  final String? phone;
  final DateTime? created;
  final DateTime? updated;
  final List<LoggedLikersInfo>? likers;
  final int? notifications;

  const LoggedUser({
    required this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.phone,
    this.created,
    this.updated,
    this.likers,
    this.notifications,
  });

  @override
  List<Object> get props => [id];
}
