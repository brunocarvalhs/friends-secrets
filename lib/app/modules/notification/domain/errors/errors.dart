import 'package:flutter/material.dart';

abstract class Failure implements Exception {
  String? get title;
  String? get message;
  Color get color;
}

class ErrorNotificationDelete extends Failure {
  @override
  final String? message;
  @override
  final String? title;
  ErrorNotificationDelete({this.title, this.message});

  @override
  Color get color => Colors.red;
}

class ErrorNotificationSelectAll extends Failure {
  @override
  final String? message;
  @override
  final String? title;
  ErrorNotificationSelectAll({this.title, this.message});

  @override
  Color get color => Colors.red;
}
