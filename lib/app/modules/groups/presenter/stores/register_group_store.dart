import 'package:asuka/asuka.dart' as asuka;
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:edge_alerts/edge_alerts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/register_group.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:friends_secrets/app/shared/widgets/loading_default.dart';

import 'package:mobx/mobx.dart';

part 'register_group_store.g.dart';

class RegisterGroupStore = _RegisterGroupStoreBase with _$RegisterGroupStore;

abstract class _RegisterGroupStoreBase with Store {
  final RegistersGroup registersGroup;

  _RegisterGroupStoreBase(this.registersGroup);

  // Type ========================================================================

  @observable
  TypeModel? _type;

  @action
  void setType(TypeModel? value) => _type = value;

  @computed
  TypeModel? get getCategory => _type;

  // users ========================================================================

  @observable
  // ignore: prefer_final_fields
  ObservableList<UserModel> _users = ObservableList<UserModel>.of([]);

  @action
  void addMember(UserModel value) => _users.add(value);

  @action
  void removeMember(UserModel value) => _users.remove(value);

  @computed
  List<UserModel>? get getUsers => _users.toList();

  // Data ========================================================================

  // Name ------------------------------------------------------------------------

  final TextEditingController controllerName = TextEditingController();

  // Discrible -------------------------------------------------------------------

  final TextEditingController controllerdescription = TextEditingController();

  // Date -------------------------------------------------------------------

  @observable
  DateTime _date = DateTime.now();

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

  // Time -------------------------------------------------------------------

  @observable
  TimeOfDay _time = TimeOfDay.now();

  @action
  void setTime(TimeOfDay? time) => _time = time ?? TimeOfDay.now();

  // Price -------------------------------------------------------------------

  final TextEditingController controllerPriceMin = TextEditingController();
  final CurrencyTextInputFormatter filterPriceMin =
      CurrencyTextInputFormatter(symbol: "");

  final TextEditingController controllerPriceMax = TextEditingController();
  final CurrencyTextInputFormatter filterPriceMax =
      CurrencyTextInputFormatter(symbol: "");

  // Functions ==================================================================

  Future<void> register(BuildContext context) async {
    var entry = OverlayEntry(builder: (context) => const LoadingDefault());
    asuka.addOverlay(entry);
    var group = GroupModel(
      author: Modular.get<AuthStore>().user as UserModel,
      name: controllerName.text,
      description: controllerdescription.text,
      date: getDate,
      type: getCategory,
      users: getUsers,
      priceMax: num.tryParse(filterPriceMax.getFormattedValue())?.toDouble(),
      priceMin: num.tryParse(filterPriceMin.getFormattedValue())?.toDouble(),
    );
    var result = await registersGroup(group);
    entry.remove();
    result.fold((failure) {
      edgeAlert(
        context,
        title: failure.title.toString(),
        description: failure.message.toString(),
        backgroundColor: failure.color,
        duration: const Duration(seconds: 10).inSeconds,
      );
    }, (group) {
      clear();
      edgeAlert(
        context,
        title: "Sucesso",
        description: "${group.name} foi criado com sucesso.",
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5).inSeconds,
      );
      Modular.to.popAndPushNamed("/home/");
    });
  }

  void clear() {
    _users.clear();
    _type = null;
    _date = DateTime.now();
    _time = TimeOfDay.now();
    controllerName.clear();
    controllerdescription.clear();
    controllerPriceMax.clear();
    controllerPriceMin.clear();
  }
}
