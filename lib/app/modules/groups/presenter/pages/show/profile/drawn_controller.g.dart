// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawn_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $DrawnController = BindInject(
  (i) => DrawnController(i<ShowUserDrawnGroup>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DrawnController on _DrawnControllerBase, Store {
  final _$userAtom = Atom(name: '_DrawnControllerBase.user');

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

  final _$_DrawnControllerBaseActionController =
      ActionController(name: '_DrawnControllerBase');

  @override
  void setUser(LoggedUserInfo? value) {
    final _$actionInfo = _$_DrawnControllerBaseActionController.startAction(
        name: '_DrawnControllerBase.setUser');
    try {
      return super.setUser(value);
    } finally {
      _$_DrawnControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user}
    ''';
  }
}
