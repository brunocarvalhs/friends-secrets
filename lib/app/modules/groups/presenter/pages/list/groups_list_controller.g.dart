// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_list_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GroupsListController = BindInject(
  (i) => GroupsListController(
      i<AuthStore>(),
      i<GetGroups>(),
      i<ListNotifiactions>(),
      i<DeleteGroup>(),
      i<SharedGroup>(),
      i<ExitGroup>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupsListController on _GroupsListControllerBase, Store {
  Computed<bool>? _$buttonExtendsComputed;

  @override
  bool get buttonExtends =>
      (_$buttonExtendsComputed ??= Computed<bool>(() => super.buttonExtends,
              name: '_GroupsListControllerBase.buttonExtends'))
          .value;
  Computed<bool>? _$isGroupsComputed;

  @override
  bool get isGroups =>
      (_$isGroupsComputed ??= Computed<bool>(() => super.isGroups,
              name: '_GroupsListControllerBase.isGroups'))
          .value;
  Computed<int>? _$countGroupsComputed;

  @override
  int get countGroups =>
      (_$countGroupsComputed ??= Computed<int>(() => super.countGroups,
              name: '_GroupsListControllerBase.countGroups'))
          .value;
  Computed<List<GroupModel>>? _$allGroupsComputed;

  @override
  List<GroupModel> get allGroups =>
      (_$allGroupsComputed ??= Computed<List<GroupModel>>(() => super.allGroups,
              name: '_GroupsListControllerBase.allGroups'))
          .value;

  final _$_buttonExtendsAtom =
      Atom(name: '_GroupsListControllerBase._buttonExtends');

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

  final _$_groupsAtom = Atom(name: '_GroupsListControllerBase._groups');

  @override
  ObservableList<GroupModel> get _groups {
    _$_groupsAtom.reportRead();
    return super._groups;
  }

  @override
  set _groups(ObservableList<GroupModel> value) {
    _$_groupsAtom.reportWrite(value, super._groups, () {
      super._groups = value;
    });
  }

  final _$notificationAtom =
      Atom(name: '_GroupsListControllerBase.notification');

  @override
  int? get notification {
    _$notificationAtom.reportRead();
    return super.notification;
  }

  @override
  set notification(int? value) {
    _$notificationAtom.reportWrite(value, super.notification, () {
      super.notification = value;
    });
  }

  final _$_GroupsListControllerBaseActionController =
      ActionController(name: '_GroupsListControllerBase');

  @override
  void setExtendsButton(bool value) {
    final _$actionInfo = _$_GroupsListControllerBaseActionController
        .startAction(name: '_GroupsListControllerBase.setExtendsButton');
    try {
      return super.setExtendsButton(value);
    } finally {
      _$_GroupsListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void add(GroupModel value) {
    final _$actionInfo = _$_GroupsListControllerBaseActionController
        .startAction(name: '_GroupsListControllerBase.add');
    try {
      return super.add(value);
    } finally {
      _$_GroupsListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAll(Iterable<GroupModel> groups) {
    final _$actionInfo = _$_GroupsListControllerBaseActionController
        .startAction(name: '_GroupsListControllerBase.addAll');
    try {
      return super.addAll(groups);
    } finally {
      _$_GroupsListControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
notification: ${notification},
buttonExtends: ${buttonExtends},
isGroups: ${isGroups},
countGroups: ${countGroups},
allGroups: ${allGroups}
    ''';
  }
}
