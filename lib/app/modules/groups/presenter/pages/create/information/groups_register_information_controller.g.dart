// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'groups_register_information_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GroupsRegisterInformationController = BindInject(
  (i) => GroupsRegisterInformationController(
      i<AuthStore>(), i<GetGroups>(), i<RegisterGroupStore>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupsRegisterInformationController
    on _GroupsRegisterInformationControllerBase, Store {
  Computed<bool>? _$buttonExtendsComputed;

  @override
  bool get buttonExtends =>
      (_$buttonExtendsComputed ??= Computed<bool>(() => super.buttonExtends,
              name: '_GroupsRegisterInformationControllerBase.buttonExtends'))
          .value;
  Computed<String>? _$getDayComputed;

  @override
  String get getDay =>
      (_$getDayComputed ??= Computed<String>(() => super.getDay,
              name: '_GroupsRegisterInformationControllerBase.getDay'))
          .value;
  Computed<String>? _$getMonthComputed;

  @override
  String get getMonth =>
      (_$getMonthComputed ??= Computed<String>(() => super.getMonth,
              name: '_GroupsRegisterInformationControllerBase.getMonth'))
          .value;
  Computed<String>? _$getYearComputed;

  @override
  String get getYear =>
      (_$getYearComputed ??= Computed<String>(() => super.getYear,
              name: '_GroupsRegisterInformationControllerBase.getYear'))
          .value;
  Computed<String>? _$getHourComputed;

  @override
  String get getHour =>
      (_$getHourComputed ??= Computed<String>(() => super.getHour,
              name: '_GroupsRegisterInformationControllerBase.getHour'))
          .value;
  Computed<String>? _$getMinuteComputed;

  @override
  String get getMinute =>
      (_$getMinuteComputed ??= Computed<String>(() => super.getMinute,
              name: '_GroupsRegisterInformationControllerBase.getMinute'))
          .value;

  final _$_buttonExtendsAtom =
      Atom(name: '_GroupsRegisterInformationControllerBase._buttonExtends');

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

  final _$_GroupsRegisterInformationControllerBaseActionController =
      ActionController(name: '_GroupsRegisterInformationControllerBase');

  @override
  void setExtendsButton(bool value) {
    final _$actionInfo =
        _$_GroupsRegisterInformationControllerBaseActionController.startAction(
            name: '_GroupsRegisterInformationControllerBase.setExtendsButton');
    try {
      return super.setExtendsButton(value);
    } finally {
      _$_GroupsRegisterInformationControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonExtends: ${buttonExtends},
getDay: ${getDay},
getMonth: ${getMonth},
getYear: ${getYear},
getHour: ${getHour},
getMinute: ${getMinute}
    ''';
  }
}
