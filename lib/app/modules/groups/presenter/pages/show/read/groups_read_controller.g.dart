// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_read_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GroupsReadController = BindInject(
  (i) => GroupsReadController(
      i<AuthStore>(), i<ReadGroup>(), i<DrawnGroup>(), i<ShowUserDrawnGroup>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupsReadController on _GroupsReadControllerBase, Store {
  Computed<GroupModel?>? _$getGroupComputed;

  @override
  GroupModel? get getGroup =>
      (_$getGroupComputed ??= Computed<GroupModel?>(() => super.getGroup,
              name: '_GroupsReadControllerBase.getGroup'))
          .value;
  Computed<bool>? _$buttonExtendsComputed;

  @override
  bool get buttonExtends =>
      (_$buttonExtendsComputed ??= Computed<bool>(() => super.buttonExtends,
              name: '_GroupsReadControllerBase.buttonExtends'))
          .value;
  Computed<bool>? _$isVisibilityDrawnComputed;

  @override
  bool get isVisibilityDrawn => (_$isVisibilityDrawnComputed ??= Computed<bool>(
          () => super.isVisibilityDrawn,
          name: '_GroupsReadControllerBase.isVisibilityDrawn'))
      .value;
  Computed<bool>? _$isDrawnComputed;

  @override
  bool get isDrawn => (_$isDrawnComputed ??= Computed<bool>(() => super.isDrawn,
          name: '_GroupsReadControllerBase.isDrawn'))
      .value;
  Computed<bool>? _$isNotDrawnComputed;

  @override
  bool get isNotDrawn =>
      (_$isNotDrawnComputed ??= Computed<bool>(() => super.isNotDrawn,
              name: '_GroupsReadControllerBase.isNotDrawn'))
          .value;

  final _$_groupModelAtom = Atom(name: '_GroupsReadControllerBase._groupModel');

  @override
  GroupModel? get _groupModel {
    _$_groupModelAtom.reportRead();
    return super._groupModel;
  }

  @override
  set _groupModel(GroupModel? value) {
    _$_groupModelAtom.reportWrite(value, super._groupModel, () {
      super._groupModel = value;
    });
  }

  final _$_buttonExtendsAtom =
      Atom(name: '_GroupsReadControllerBase._buttonExtends');

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

  final _$_drawnAtom = Atom(name: '_GroupsReadControllerBase._drawn');

  @override
  bool get _drawn {
    _$_drawnAtom.reportRead();
    return super._drawn;
  }

  @override
  set _drawn(bool value) {
    _$_drawnAtom.reportWrite(value, super._drawn, () {
      super._drawn = value;
    });
  }

  final _$_GroupsReadControllerBaseActionController =
      ActionController(name: '_GroupsReadControllerBase');

  @override
  void setGroup(GroupModel value) {
    final _$actionInfo = _$_GroupsReadControllerBaseActionController
        .startAction(name: '_GroupsReadControllerBase.setGroup');
    try {
      return super.setGroup(value);
    } finally {
      _$_GroupsReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDrawn(bool value) {
    final _$actionInfo = _$_GroupsReadControllerBaseActionController
        .startAction(name: '_GroupsReadControllerBase.setDrawn');
    try {
      return super.setDrawn(value);
    } finally {
      _$_GroupsReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExtendsButton(bool value) {
    final _$actionInfo = _$_GroupsReadControllerBaseActionController
        .startAction(name: '_GroupsReadControllerBase.setExtendsButton');
    try {
      return super.setExtendsButton(value);
    } finally {
      _$_GroupsReadControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getGroup: ${getGroup},
buttonExtends: ${buttonExtends},
isVisibilityDrawn: ${isVisibilityDrawn},
isDrawn: ${isDrawn},
isNotDrawn: ${isNotDrawn}
    ''';
  }
}
