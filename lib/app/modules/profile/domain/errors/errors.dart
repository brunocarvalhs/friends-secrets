import 'package:flutter/material.dart';

abstract class Failure implements Exception {
  String? get title;
  String? get message;
  Color get color;
}

class ErrorLikersDelete extends Failure {
  @override
  final String? message;
  @override
  final String? title;
  ErrorLikersDelete({this.title, this.message});

  @override
  Color get color => Colors.red;
}

class ErrorLikersSelectAll extends Failure {
  @override
  final String? message;
  @override
  final String? title;
  ErrorLikersSelectAll({this.title, this.message});

  @override
  Color get color => Colors.red;
}

class ErrorLikersSave extends Failure {
  @override
  final String? message;
  @override
  final String? title;
  ErrorLikersSave({this.title, this.message});

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

class ErrorGetLoggedUser extends Failure {
  @override
  final String? message;
  @override
  final String? title;
  ErrorGetLoggedUser({this.title, this.message});

  @override
  Color get color => Colors.red;
}
