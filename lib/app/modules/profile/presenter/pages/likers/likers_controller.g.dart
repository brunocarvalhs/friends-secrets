// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likers_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $LikersController = BindInject(
  (i) => LikersController(i<AuthStore>(), i<ListLikers>(), i<SaveListLikes>()),
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
  Computed<bool>? _$isLikersComputed;

  @override
  bool get isLikers =>
      (_$isLikersComputed ??= Computed<bool>(() => super.isLikers,
              name: '_LikersControllerBase.isLikers'))
          .value;
  Computed<int>? _$countLikersComputed;

  @override
  int get countLikers =>
      (_$countLikersComputed ??= Computed<int>(() => super.countLikers,
              name: '_LikersControllerBase.countLikers'))
          .value;
  Computed<List<LoggedLikersInfo>>? _$allItemsComputed;

  @override
  List<LoggedLikersInfo> get allItems => (_$allItemsComputed ??=
          Computed<List<LoggedLikersInfo>>(() => super.allItems,
              name: '_LikersControllerBase.allItems'))
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

  final _$_likersAtom = Atom(name: '_LikersControllerBase._likers');

  @override
  ObservableList<LoggedLikersInfo> get _likers {
    _$_likersAtom.reportRead();
    return super._likers;
  }

  @override
  set _likers(ObservableList<LoggedLikersInfo> value) {
    _$_likersAtom.reportWrite(value, super._likers, () {
      super._likers = value;
    });
  }

  final _$_itemAtom = Atom(name: '_LikersControllerBase._item');

  @override
  ObservableList<LoggedLikersInfo> get _item {
    _$_itemAtom.reportRead();
    return super._item;
  }

  @override
  set _item(ObservableList<LoggedLikersInfo> value) {
    _$_itemAtom.reportWrite(value, super._item, () {
      super._item = value;
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
  void selecLike(LoggedLikersInfo value) {
    final _$actionInfo = _$_LikersControllerBaseActionController.startAction(
        name: '_LikersControllerBase.selecLike');
    try {
      return super.selecLike(value);
    } finally {
      _$_LikersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeLike(LoggedLikersInfo value) {
    final _$actionInfo = _$_LikersControllerBaseActionController.startAction(
        name: '_LikersControllerBase.removeLike');
    try {
      return super.removeLike(value);
    } finally {
      _$_LikersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addAll(Iterable<LoggedLikersInfo> likers) {
    final _$actionInfo = _$_LikersControllerBaseActionController.startAction(
        name: '_LikersControllerBase.addAll');
    try {
      return super.addAll(likers);
    } finally {
      _$_LikersControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonExtends: ${buttonExtends},
isLikers: ${isLikers},
countLikers: ${countLikers},
allItems: ${allItems}
    ''';
  }
}
