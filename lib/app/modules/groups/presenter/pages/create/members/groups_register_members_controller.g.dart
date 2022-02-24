// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_register_members_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GroupsRegisterMembersController = BindInject(
  (i) => GroupsRegisterMembersController(
      i<AuthStore>(), i<RegisterGroupStore>(), i<ListContacts>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupsRegisterMembersController
    on _GroupsRegisterMembersControllerBase, Store {
  Computed<bool>? _$isContactsComputed;

  @override
  bool get isContacts =>
      (_$isContactsComputed ??= Computed<bool>(() => super.isContacts,
              name: '_GroupsRegisterMembersControllerBase.isContacts'))
          .value;
  Computed<int>? _$countContactsComputed;

  @override
  int get countContacts =>
      (_$countContactsComputed ??= Computed<int>(() => super.countContacts,
              name: '_GroupsRegisterMembersControllerBase.countContacts'))
          .value;
  Computed<List<UserModel>>? _$allContactsComputed;

  @override
  List<UserModel> get allContacts => (_$allContactsComputed ??=
          Computed<List<UserModel>>(() => super.allContacts,
              name: '_GroupsRegisterMembersControllerBase.allContacts'))
      .value;
  Computed<bool>? _$buttonExtendsComputed;

  @override
  bool get buttonExtends =>
      (_$buttonExtendsComputed ??= Computed<bool>(() => super.buttonExtends,
              name: '_GroupsRegisterMembersControllerBase.buttonExtends'))
          .value;

  final _$_listContactsAtom =
      Atom(name: '_GroupsRegisterMembersControllerBase._listContacts');

  @override
  ObservableList<UserModel> get _listContacts {
    _$_listContactsAtom.reportRead();
    return super._listContacts;
  }

  @override
  set _listContacts(ObservableList<UserModel> value) {
    _$_listContactsAtom.reportWrite(value, super._listContacts, () {
      super._listContacts = value;
    });
  }

  final _$_buttonExtendsAtom =
      Atom(name: '_GroupsRegisterMembersControllerBase._buttonExtends');

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

  final _$_GroupsRegisterMembersControllerBaseActionController =
      ActionController(name: '_GroupsRegisterMembersControllerBase');

  @override
  void add(UserModel value) {
    final _$actionInfo = _$_GroupsRegisterMembersControllerBaseActionController
        .startAction(name: '_GroupsRegisterMembersControllerBase.add');
    try {
      return super.add(value);
    } finally {
      _$_GroupsRegisterMembersControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void addAll(Iterable<UserModel> contacts) {
    final _$actionInfo = _$_GroupsRegisterMembersControllerBaseActionController
        .startAction(name: '_GroupsRegisterMembersControllerBase.addAll');
    try {
      return super.addAll(contacts);
    } finally {
      _$_GroupsRegisterMembersControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setExtendsButton(bool value) {
    final _$actionInfo =
        _$_GroupsRegisterMembersControllerBaseActionController.startAction(
            name: '_GroupsRegisterMembersControllerBase.setExtendsButton');
    try {
      return super.setExtendsButton(value);
    } finally {
      _$_GroupsRegisterMembersControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isContacts: ${isContacts},
countContacts: ${countContacts},
allContacts: ${allContacts},
buttonExtends: ${buttonExtends}
    ''';
  }
}
