import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/update_group.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:friends_secrets/app/shared/widgets/loading_default.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;

part "group_edit_information_controller.g.dart";

@Injectable()
class GroupsUpdateInformationController = _GroupsUpdateInformationControllerBase
    with _$GroupsUpdateInformationController;

abstract class _GroupsUpdateInformationControllerBase with Store {
  final UpdateGroup _updateGroup;

  _GroupsUpdateInformationControllerBase(this._updateGroup) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Group Update Information');
  }

  Future<void> update(BuildContext context) async {
    var entry = OverlayEntry(builder: (context) => const LoadingDefault());
    asuka.addOverlay(entry);
    var group = (Modular.args.data as GroupModel).copyWith(
      author: Modular.get<AuthStore>().user as UserModel,
      name: controllerName.text,
      description: controllerDescription.text,
      date: getDate.toIso8601String(),
      priceMax: num.tryParse(controllerPriceMax.text)?.toDouble(),
      priceMin: num.tryParse(controllerPriceMin.text)?.toDouble(),
    );
    var result = await _updateGroup(Modular.args.params["id"], group);
    entry.remove();
    result.fold((failure) {
      asuka.AsukaSnackbar.warning(failure.message.toString()).show();
    }, (r) => Modular.to.pop());
  }

  // Name ------------------------------------------------------------------------

  final TextEditingController controllerName = TextEditingController(text: (Modular.args.data as GroupModel).name);

  // Discrible -------------------------------------------------------------------

  final TextEditingController controllerDescription =
      TextEditingController(text: (Modular.args.data as GroupModel).description);

  // Date -------------------------------------------------------------------

  @observable
  DateTime _date = DateTime.parse((Modular.args.data as GroupModel).date!);

  @action
  void setDate(DateTime? date) => _date = date ?? DateTime.now();

  @computed
  DateTime get getDate => DateTime(
        _date.year,
        _date.month,
        _date.day,
        _time.hour,
        _time.minute,
        _date.second,
        _date.millisecond,
        _date.microsecond,
      );

  @computed
  String get getDay => getDate.day.toString();

  @computed
  String get getMonth => getDate.month.toString();

  @computed
  String get getYear => getDate.year.toString();

  // Time -------------------------------------------------------------------

  @observable
  TimeOfDay _time = TimeOfDay.now();

  @action
  void setTime(TimeOfDay? time) => _time = time ?? TimeOfDay.now();

  @computed
  String get getHour => getDate.hour.toString();

  @computed
  String get getMinute => getDate.minute.toString();

  // Price -------------------------------------------------------------------

  final TextEditingController controllerPriceMin =
      TextEditingController(text: (Modular.args.data as GroupModel).priceMin.toString());
  final TextEditingController controllerPriceMax =
      TextEditingController(text: (Modular.args.data as GroupModel).priceMax.toString());

  final CurrencyTextInputFormatter filterPriceMin = CurrencyTextInputFormatter(symbol: "");

  final CurrencyTextInputFormatter filterPriceMax = CurrencyTextInputFormatter(symbol: "");

  // Functions ==================================================================

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

  Future<void> defineDate(BuildContext context) async {
    final current = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 3),
    );
    setDate(current);
  }

  Future<void> defineTime(BuildContext context) async {
    final current = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );
    setTime(current ?? TimeOfDay.fromDateTime(DateTime.now()));
  }
}
