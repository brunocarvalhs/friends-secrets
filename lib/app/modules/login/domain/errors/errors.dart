abstract class Failure implements Exception {
  String? get message;
}

class ErrorLogin extends Failure {
  @override
  final String? message;
  ErrorLogin({this.message});
}

class ErrorGetLoggedUser extends Failure {
  @override
  final String? message;
  ErrorGetLoggedUser({this.message});
}

class ErrorLogout extends Failure {
  @override
  final String? message;
  ErrorLogout({this.message});
}

class NotAutomaticRetrieved implements Failure {
  final String? verificationId;
  @override
  final String? message;
  NotAutomaticRetrieved(this.verificationId, {this.message});
}

class InternalError implements Failure {
  @override
  final String? message;
  InternalError({this.message});
}
