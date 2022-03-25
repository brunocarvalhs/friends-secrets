import 'package:flutter/material.dart';

abstract class Failure implements Exception {
  String? get title;
  String? get message;
  Color get color;
}

class ErrorSelect extends Failure {
  @override
  final String? title;
  @override
  final String? message;
  @override
  final Color color = Colors.red;
  ErrorSelect({this.title, this.message});
}

class ErrorSelectAll extends Failure {
  @override
  final String? title;
  @override
  final String? message;
  @override
  final Color color = Colors.red;
  ErrorSelectAll({this.title, this.message});
}

class ErrorCreate extends Failure {
  @override
  final String? title;
  @override
  final String? message;
  @override
  final Color color = Colors.red;
  ErrorCreate({this.title, this.message});
}

class ErrorUpdate extends Failure {
  @override
  final String? title;
  @override
  final String? message;
  @override
  final Color color = Colors.red;
  ErrorUpdate({this.title, this.message});
}

class ErrorRemove extends Failure {
  @override
  final String? title;
  @override
  final String? message;
  @override
  final Color color = Colors.red;
  ErrorRemove({this.title, this.message});
}

class ErrorPlaceMaps extends Failure {
  @override
  final String? title;
  @override
  final String? message;
  @override
  final Color color = Colors.red;
  ErrorPlaceMaps({this.title, this.message});
}

class ErrorImageAlbum extends Failure {
  @override
  final String? title;
  @override
  final String? message;
  @override
  final Color color = Colors.red;
  ErrorImageAlbum({this.title, this.message});
}
