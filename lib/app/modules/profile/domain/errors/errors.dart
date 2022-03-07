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
