import 'package:equatable/equatable.dart';

class LoggedUser extends Equatable {
  final String uuid;
  final String? email;
  final String? name;
  final String? photoUrl;
  final String? phone;

  const LoggedUser({
    required this.uuid,
    this.name,
    this.email,
    this.photoUrl,
    this.phone,
  });

  @override
  List<Object> get props => [uuid];
}
