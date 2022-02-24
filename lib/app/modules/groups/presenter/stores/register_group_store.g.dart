// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_group_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterGroupStore on _RegisterGroupStoreBase, Store {
  Computed<TypeModel?>? _$getCategoryComputed;

  @override
  TypeModel? get getCategory =>
      (_$getCategoryComputed ??= Computed<TypeModel?>(() => super.getCategory,
              name: '_RegisterGroupStoreBase.getCategory'))
          .value;
  Computed<List<UserModel>?>? _$getUsersComputed;

  @override
  List<UserModel>? get getUsers =>
      (_$getUsersComputed ??= Computed<List<UserModel>?>(() => super.getUsers,
              name: '_RegisterGroupStoreBase.getUsers'))
          .value;
  Computed<DateTime>? _$getDateComputed;

  @override
  DateTime get getDate =>
      (_$getDateComputed ??= Computed<DateTime>(() => super.getDate,
              name: '_RegisterGroupStoreBase.getDate'))
          .value;

  final _$_typeAtom = Atom(name: '_RegisterGroupStoreBase._type');

  @override
  TypeModel? get _type {
    _$_typeAtom.reportRead();
    return super._type;
  }

  @override
  set _type(TypeModel? value) {
    _$_typeAtom.reportWrite(value, super._type, () {
      super._type = value;
    });
  }

  final _$_usersAtom = Atom(name: '_RegisterGroupStoreBase._users');

  @override
  ObservableList<UserModel> get _users {
    _$_usersAtom.reportRead();
    return super._users;
  }

  @override
  set _users(ObservableList<UserModel> value) {
    _$_usersAtom.reportWrite(value, super._users, () {
      super._users = value;
    });
  }

  final _$_dateAtom = Atom(name: '_RegisterGroupStoreBase._date');

  @override
  DateTime get _date {
    _$_dateAtom.reportRead();
    return super._date;
  }

  @override
  set _date(DateTime value) {
    _$_dateAtom.reportWrite(value, super._date, () {
      super._date = value;
    });
  }

  final _$_timeAtom = Atom(name: '_RegisterGroupStoreBase._time');

  @override
  TimeOfDay get _time {
    _$_timeAtom.reportRead();
    return super._time;
  }

  @override
  set _time(TimeOfDay value) {
    _$_timeAtom.reportWrite(value, super._time, () {
      super._time = value;
    });
  }

  final _$rangeSliderDiscreteValuesAtom =
      Atom(name: '_RegisterGroupStoreBase.rangeSliderDiscreteValues');

  @override
  RangeValues get rangeSliderDiscreteValues {
    _$rangeSliderDiscreteValuesAtom.reportRead();
    return super.rangeSliderDiscreteValues;
  }

  @override
  set rangeSliderDiscreteValues(RangeValues value) {
    _$rangeSliderDiscreteValuesAtom
        .reportWrite(value, super.rangeSliderDiscreteValues, () {
      super.rangeSliderDiscreteValues = value;
    });
  }

  final _$_RegisterGroupStoreBaseActionController =
      ActionController(name: '_RegisterGroupStoreBase');

  @override
  void setType(TypeModel? value) {
    final _$actionInfo = _$_RegisterGroupStoreBaseActionController.startAction(
        name: '_RegisterGroupStoreBase.setType');
    try {
      return super.setType(value);
    } finally {
      _$_RegisterGroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addMember(UserModel value) {
    final _$actionInfo = _$_RegisterGroupStoreBaseActionController.startAction(
        name: '_RegisterGroupStoreBase.addMember');
    try {
      return super.addMember(value);
    } finally {
      _$_RegisterGroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeMember(UserModel value) {
    final _$actionInfo = _$_RegisterGroupStoreBaseActionController.startAction(
        name: '_RegisterGroupStoreBase.removeMember');
    try {
      return super.removeMember(value);
    } finally {
      _$_RegisterGroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDate(DateTime? date) {
    final _$actionInfo = _$_RegisterGroupStoreBaseActionController.startAction(
        name: '_RegisterGroupStoreBase.setDate');
    try {
      return super.setDate(date);
    } finally {
      _$_RegisterGroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTime(TimeOfDay? time) {
    final _$actionInfo = _$_RegisterGroupStoreBaseActionController.startAction(
        name: '_RegisterGroupStoreBase.setTime');
    try {
      return super.setTime(time);
    } finally {
      _$_RegisterGroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(RangeValues price) {
    final _$actionInfo = _$_RegisterGroupStoreBaseActionController.startAction(
        name: '_RegisterGroupStoreBase.setPrice');
    try {
      return super.setPrice(price);
    } finally {
      _$_RegisterGroupStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
rangeSliderDiscreteValues: ${rangeSliderDiscreteValues},
getCategory: ${getCategory},
getUsers: ${getUsers},
getDate: ${getDate}
    ''';
  }
}
