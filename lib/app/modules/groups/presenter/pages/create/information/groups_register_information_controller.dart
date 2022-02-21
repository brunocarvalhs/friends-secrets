import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/get_groups.dart';
import 'package:friends_secrets/app/modules/groups/presenter/stores/register_group_store.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part "groups_register_information_controller.g.dart";

@Injectable()
class GroupsRegisterInformationController = _GroupsRegisterInformationControllerBase
    with _$GroupsRegisterInformationController;

abstract class _GroupsRegisterInformationControllerBase with Store {
  final AuthStore user;
  final GetGroups getGroups;
  final RegisterGroupStore registerGroupStore;

  _GroupsRegisterInformationControllerBase(this.user, this.getGroups, this.registerGroupStore);

  Future<void> register() async {
    registerGroupStore.register().then((value) => Modular.to.pushNamed("/home"));
  }

  TextEditingController get controllerPriceMin => registerGroupStore.controllerPriceMin;
  TextEditingController get controllerName => registerGroupStore.controllerName;
  TextEditingController get controllerPriceMax => registerGroupStore.controllerPriceMax;
  TextEditingController get controllerDescription => registerGroupStore.controllerdescription;

  @computed
  RangeValues get rangeSliderDiscreteValues => registerGroupStore.rangeSliderDiscreteValues;

  @action
  void setPrice(RangeValues value) => registerGroupStore.setPrice(value);

  @observable
  bool _buttonExtends = true;

  @computed
  bool get buttonExtends => _buttonExtends;

  @action
  void setExtendsButton(bool value) => _buttonExtends = value;

  bool notificationPredicate(ScrollNotification scroll) {
    setExtendsButton(scroll.metrics.extentAfter > scroll.metrics.extentBefore);
    return true;
  }

  @computed
  String get getDay => registerGroupStore.getDate.day.toString();

  @computed
  String get getMonth => registerGroupStore.getDate.month.toString();

  @computed
  String get getYear => registerGroupStore.getDate.year.toString();

  @computed
  String get getHour => registerGroupStore.getDate.hour.toString();

  @computed
  String get getMinute => registerGroupStore.getDate.minute.toString();

  Future<void> defineDate(BuildContext context) async {
    final current = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 3),
    );
    registerGroupStore.setDate(current);
  }

  Future<void> defineTime(BuildContext context) async {
    final current = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    registerGroupStore.setTime(current ?? TimeOfDay.fromDateTime(DateTime.now()));
  }
}
