import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/get_groups.dart';
import 'package:friends_secrets/app/modules/groups/presenter/stores/update_group_store.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part "group_edit_information_controller.g.dart";

@Injectable()
class GroupsUpdateInformationController = _GroupsUpdateInformationControllerBase
    with _$GroupsUpdateInformationController;

abstract class _GroupsUpdateInformationControllerBase with Store {
  final AuthStore user;
  final GetGroups getGroups;
  final UpdateGroupStore updateGroupStore;

  _GroupsUpdateInformationControllerBase(this.user, this.getGroups, this.updateGroupStore) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Group Update Information');
  }

  Future<void> register() async {
    updateGroupStore.register().then((value) => Modular.to.pushNamed("/home/"));
  }

  TextEditingController get controllerPriceMin => updateGroupStore.controllerPriceMin;
  TextEditingController get controllerName => updateGroupStore.controllerName;
  TextEditingController get controllerPriceMax => updateGroupStore.controllerPriceMax;
  TextEditingController get controllerDescription => updateGroupStore.controllerdescription;

  @computed
  RangeValues get rangeSliderDiscreteValues => updateGroupStore.rangeSliderDiscreteValues;

  @action
  void setPrice(RangeValues value) => updateGroupStore.setPrice(value);

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
  String get getDay => updateGroupStore.getDate.day.toString();

  @computed
  String get getMonth => updateGroupStore.getDate.month.toString();

  @computed
  String get getYear => updateGroupStore.getDate.year.toString();

  @computed
  String get getHour => updateGroupStore.getDate.hour.toString();

  @computed
  String get getMinute => updateGroupStore.getDate.minute.toString();

  Future<void> defineDate(BuildContext context) async {
    final current = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 3),
    );
    updateGroupStore.setDate(current);
  }

  Future<void> defineTime(BuildContext context) async {
    final current = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    updateGroupStore.setTime(current ?? TimeOfDay.fromDateTime(DateTime.now()));
  }
}
