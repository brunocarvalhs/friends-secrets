// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_register_type_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GroupsRegisterTypeController = BindInject(
  (i) => GroupsRegisterTypeController(
      i<AuthStore>(), i<ListTypes>(), i<RegisterGroupStore>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupsRegisterTypeController
    on _GroupsRegisterTypeControllerBase, Store {
  Computed<bool>? _$isTypeComputed;

  @override
  bool get isType => (_$isTypeComputed ??= Computed<bool>(() => super.isType,
          name: '_GroupsRegisterTypeControllerBase.isType'))
      .value;
  Computed<int>? _$countTypeComputed;

  @override
  int get countType =>
      (_$countTypeComputed ??= Computed<int>(() => super.countType,
              name: '_GroupsRegisterTypeControllerBase.countType'))
          .value;
  Computed<List<TypeModel>>? _$allTypeComputed;

  @override
  List<TypeModel> get allType =>
      (_$allTypeComputed ??= Computed<List<TypeModel>>(() => super.allType,
              name: '_GroupsRegisterTypeControllerBase.allType'))
          .value;
  Computed<bool>? _$buttonExtendsComputed;

  @override
  bool get buttonExtends =>
      (_$buttonExtendsComputed ??= Computed<bool>(() => super.buttonExtends,
              name: '_GroupsRegisterTypeControllerBase.buttonExtends'))
          .value;

  final _$_listTypeAtom =
      Atom(name: '_GroupsRegisterTypeControllerBase._listType');

  @override
  ObservableList<TypeModel> get _listType {
    _$_listTypeAtom.reportRead();
    return super._listType;
  }

  @override
  set _listType(ObservableList<TypeModel> value) {
    _$_listTypeAtom.reportWrite(value, super._listType, () {
      super._listType = value;
    });
  }

  final _$loadingAtom = Atom(name: '_GroupsRegisterTypeControllerBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$_buttonExtendsAtom =
      Atom(name: '_GroupsRegisterTypeControllerBase._buttonExtends');

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

  final _$_GroupsRegisterTypeControllerBaseActionController =
      ActionController(name: '_GroupsRegisterTypeControllerBase');

  @override
  void add(TypeModel value) {
    final _$actionInfo = _$_GroupsRegisterTypeControllerBaseActionController
        .startAction(name: '_GroupsRegisterTypeControllerBase.add');
    try {
      return super.add(value);
    } finally {
      _$_GroupsRegisterTypeControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addAll(Iterable<TypeModel> contacts) {
    final _$actionInfo = _$_GroupsRegisterTypeControllerBaseActionController
        .startAction(name: '_GroupsRegisterTypeControllerBase.addAll');
    try {
      return super.addAll(contacts);
    } finally {
      _$_GroupsRegisterTypeControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_GroupsRegisterTypeControllerBaseActionController
        .startAction(name: '_GroupsRegisterTypeControllerBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_GroupsRegisterTypeControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setExtendsButton(bool value) {
    final _$actionInfo =
        _$_GroupsRegisterTypeControllerBaseActionController.startAction(
            name: '_GroupsRegisterTypeControllerBase.setExtendsButton');
    try {
      return super.setExtendsButton(value);
    } finally {
      _$_GroupsRegisterTypeControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
isType: ${isType},
countType: ${countType},
allType: ${allType},
buttonExtends: ${buttonExtends}
    ''';
  }
}
