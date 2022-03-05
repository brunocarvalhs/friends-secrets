import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Failure implements Exception {
  String? get title;
  String? get message;
  Color get color;
}

class ErrorLogin extends Failure {
  @override
  final String? message;
  @override
  final String? title;
  ErrorLogin({this.title, this.message});

  @override
  Color get color => Colors.red;
}

class ErrorGetLoggedUser extends Failure {
  @override
  final String? message;
  @override
  final String? title;
  ErrorGetLoggedUser({this.title, this.message});

  @override
  Color get color => Colors.red;
}

class ErrorLogout extends Failure {
  @override
  final String? message;
  @override
  final String? title;
  ErrorLogout({this.title, this.message});

  @override
  Color get color => Colors.red;
}

class NotAutomaticRetrieved implements Failure {
  @override
  final String? message;
  @override
  final String? title;
  NotAutomaticRetrieved({this.title, this.message});

  @override
  Color get color => Colors.red;
}

class ServerConnectError implements Failure {
  @override
  final String? message;
  @override
  final String? title;
  ServerConnectError({this.title, this.message});

  @override
  Color get color => Colors.purple;
}

class ConnectError implements Failure {
  @override
  final String? message;
  @override
  final String? title;
  ConnectError({this.title, this.message});

  @override
  Color get color => Colors.purple;
}

class InternalError implements Failure {
  @override
  final String? message;
  @override
  final String? title;
  InternalError({this.title, this.message});

  @override
  Color get color => Colors.purple;
}
