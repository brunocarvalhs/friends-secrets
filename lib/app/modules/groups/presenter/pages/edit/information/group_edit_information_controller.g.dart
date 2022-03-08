// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group_edit_information_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $GroupsUpdateInformationController = BindInject(
  (i) => GroupsUpdateInformationController(
      i<AuthStore>(), i<GetGroups>(), i<UpdateGroupStore>()),
  isSingleton: true,
  isLazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GroupsUpdateInformationController
    on _GroupsUpdateInformationControllerBase, Store {
  Computed<RangeValues>? _$rangeSliderDiscreteValuesComputed;

  @override
  RangeValues get rangeSliderDiscreteValues =>
      (_$rangeSliderDiscreteValuesComputed ??= Computed<RangeValues>(
              () => super.rangeSliderDiscreteValues,
              name:
                  '_GroupsUpdateInformationControllerBase.rangeSliderDiscreteValues'))
          .value;
  Computed<bool>? _$buttonExtendsComputed;

  @override
  bool get buttonExtends =>
      (_$buttonExtendsComputed ??= Computed<bool>(() => super.buttonExtends,
              name: '_GroupsUpdateInformationControllerBase.buttonExtends'))
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
  void setPrice(RangeValues value) {
    final _$actionInfo =
        _$_GroupsUpdateInformationControllerBaseActionController.startAction(
            name: '_GroupsUpdateInformationControllerBase.setPrice');
    try {
      return super.setPrice(value);
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
rangeSliderDiscreteValues: ${rangeSliderDiscreteValues},
buttonExtends: ${buttonExtends},
getDay: ${getDay},
getMonth: ${getMonth},
getYear: ${getYear},
getHour: ${getHour},
getMinute: ${getMinute}
    ''';
  }
}
