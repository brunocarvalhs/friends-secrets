// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likers_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LikersController = BindInject(
  (i) => LikersController(i<AuthStore>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LikersController on _LikersControllerBase, Store {
  Computed<bool>? _$buttonExtendsComputed;

  @override
  bool get buttonExtends =>
      (_$buttonExtendsComputed ??= Computed<bool>(() => super.buttonExtends,
              name: '_LikersControllerBase.buttonExtends'))
          .value;

  final _$_buttonExtendsAtom =
      Atom(name: '_LikersControllerBase._buttonExtends');

  @override
  bool get _buttonExtends {
    _$_buttonExtendsAtom.reportRead();
    return super._buttonExtends;
  }

  @override
  set _buttonExtends(bool value) {
    _$_buttonExtendsAtom.reportWrite(value, super._buttonExtends, () {
      super._buttonExtends = value;
    });
  }

  final _$_LikersControllerBaseActionController =
      ActionController(name: '_LikersControllerBase');

  @override
  void setExtendsButton(bool value) {
    final _$actionInfo = _$_LikersControllerBaseActionController.startAction(
        name: '_LikersControllerBase.setExtendsButton');
    try {
      return super.setExtendsButton(value);
    } finally {
      _$_LikersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonExtends: ${buttonExtends}
    ''';
  }
}
