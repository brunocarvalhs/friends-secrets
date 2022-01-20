// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on _AuthStoreBase, Store {
  Computed<bool>? _$isLoggedComputed;

  @override
  bool get isLogged => (_$isLoggedComputed ??=
          Computed<bool>(() => super.isLogged, name: '_AuthStoreBase.isLogged'))
      .value;
  Computed<String?>? _$getNameComputed;

  @override
  String? get getName =>
      (_$getNameComputed ??= Computed<String?>(() => super.getName,
              name: '_AuthStoreBase.getName'))
          .value;
  Computed<String?>? _$getEmailComputed;

  @override
  String? get getEmail =>
      (_$getEmailComputed ??= Computed<String?>(() => super.getEmail,
              name: '_AuthStoreBase.getEmail'))
          .value;
  Computed<String?>? _$getPhotoComputed;

  @override
  String? get getPhoto =>
      (_$getPhotoComputed ??= Computed<String?>(() => super.getPhoto,
              name: '_AuthStoreBase.getPhoto'))
          .value;

  final _$userAtom = Atom(name: '_AuthStoreBase.user');

  @override
  LoggedUserInfo? get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(LoggedUserInfo? value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$_AuthStoreBaseActionController =
      ActionController(name: '_AuthStoreBase');

  @override
  void setUser(LoggedUserInfo? value) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String name) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setName');
    try {
      return super.setName(name);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setEmail');
    try {
      return super.setEmail(email);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhoto(String photo) {
    final _$actionInfo = _$_AuthStoreBaseActionController.startAction(
        name: '_AuthStoreBase.setPhoto');
    try {
      return super.setPhoto(photo);
    } finally {
      _$_AuthStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLogged: ${isLogged},
getName: ${getName},
getEmail: ${getEmail},
getPhoto: ${getPhoto}
    ''';
  }
}
