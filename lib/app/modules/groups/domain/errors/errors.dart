abstract class Failure implements Exception {
  String? get message;
}

class ErrorSelect extends Failure {
  @override
  final String? message;
  ErrorSelect({this.message});
}

class ErrorSelectAll extends Failure {
  @override
  final String? message;
  ErrorSelectAll({this.message});
}

class ErrorCreate extends Failure {
  @override
  final String? message;
  ErrorCreate({this.message});
}

class ErrorUpdate extends Failure {
  @override
  final String? message;
  ErrorUpdate({this.message});
}

class ErrorRemove extends Failure {
  @override
  final String? message;
  ErrorRemove({this.message});
}

class ErrorPlaceMaps extends Failure {
  @override
  final String? message;
  ErrorPlaceMaps({this.message});
}

class ErrorImageAlbum extends Failure {
  @override
  final String? message;
  ErrorImageAlbum({this.message});
}
