// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_edit_information_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GroupsUpdateInformationController = BindInject(
  (i) => GroupsUpdateInformationController(i<UpdateGroup>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupsUpdateInformationController
    on _GroupsUpdateInformationControllerBase, Store {
  Computed<DateTime>? _$getDateComputed;

  @override
  DateTime get getDate =>
      (_$getDateComputed ??= Computed<DateTime>(() => super.getDate,
              name: '_GroupsUpdateInformationControllerBase.getDate'))
          .value;
  Computed<String>? _$getDayComputed;

  @override
  String get getDay =>
      (_$getDayComputed ??= Computed<String>(() => super.getDay,
              name: '_GroupsUpdateInformationControllerBase.getDay'))
          .value;
  Computed<String>? _$getMonthComputed;

  @override
  String get getMonth =>
      (_$getMonthComputed ??= Computed<String>(() => super.getMonth,
              name: '_GroupsUpdateInformationControllerBase.getMonth'))
          .value;
  Computed<String>? _$getYearComputed;

  @override
  String get getYear =>
      (_$getYearComputed ??= Computed<String>(() => super.getYear,
              name: '_GroupsUpdateInformationControllerBase.getYear'))
          .value;
  Computed<String>? _$getHourComputed;

  @override
  String get getHour =>
      (_$getHourComputed ??= Computed<String>(() => super.getHour,
              name: '_GroupsUpdateInformationControllerBase.getHour'))
          .value;
  Computed<String>? _$getMinuteComputed;

  @override
  String get getMinute =>
      (_$getMinuteComputed ??= Computed<String>(() => super.getMinute,
              name: '_GroupsUpdateInformationControllerBase.getMinute'))
          .value;
  Computed<bool>? _$buttonExtendsComputed;

  @override
  bool get buttonExtends =>
      (_$buttonExtendsComputed ??= Computed<bool>(() => super.buttonExtends,
              name: '_GroupsUpdateInformationControllerBase.buttonExtends'))
          .value;

  final _$_dateAtom =
      Atom(name: '_GroupsUpdateInformationControllerBase._date');

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

  final _$_timeAtom =
      Atom(name: '_GroupsUpdateInformationControllerBase._time');

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

  final _$_buttonExtendsAtom =
      Atom(name: '_GroupsUpdateInformationControllerBase._buttonExtends');

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

  final _$_GroupsUpdateInformationControllerBaseActionController =
      ActionController(name: '_GroupsUpdateInformationControllerBase');

  @override
  void setDate(DateTime? date) {
    final _$actionInfo =
        _$_GroupsUpdateInformationControllerBaseActionController.startAction(
            name: '_GroupsUpdateInformationControllerBase.setDate');
    try {
      return super.setDate(date);
    } finally {
      _$_GroupsUpdateInformationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTime(TimeOfDay? time) {
    final _$actionInfo =
        _$_GroupsUpdateInformationControllerBaseActionController.startAction(
            name: '_GroupsUpdateInformationControllerBase.setTime');
    try {
      return super.setTime(time);
    } finally {
      _$_GroupsUpdateInformationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setExtendsButton(bool value) {
    final _$actionInfo =
        _$_GroupsUpdateInformationControllerBaseActionController.startAction(
            name: '_GroupsUpdateInformationControllerBase.setExtendsButton');
    try {
      return super.setExtendsButton(value);
    } finally {
      _$_GroupsUpdateInformationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getDate: ${getDate},
getDay: ${getDay},
getMonth: ${getMonth},
getYear: ${getYear},
getHour: ${getHour},
getMinute: ${getMinute},
buttonExtends: ${buttonExtends}
    ''';
  }
}
