import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/register_group.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
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

  // Members ========================================================================

  @observable
  ObservableList<UserModel> _members = ObservableList<UserModel>.of([]);

  @action
  void addMember(UserModel value) => _members.add(value);

  @action
  void removeMember(UserModel value) => _members.remove(value);

  @computed
  List<UserModel>? get getMembers => _members.toList();

  // Data ========================================================================

  // Name ------------------------------------------------------------------------

  final TextEditingController controllerName = TextEditingController();

  // Discrible -------------------------------------------------------------------

  final TextEditingController controllerDescrible = TextEditingController();

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
  final TextEditingController controllerPriceMax = TextEditingController();

  @observable
  RangeValues rangeSliderDiscreteValues = const RangeValues(0, 100);

  @action
  void setPrice(RangeValues price) {
    controllerPriceMax.text = price.end.toStringAsFixed(2);
    controllerPriceMin.text = price.start.toStringAsFixed(2);
    rangeSliderDiscreteValues = price;
  }

  // Functions ==================================================================

  Future<void> register() async {
    var entry = OverlayEntry(builder: (context) => const LoadingDefault());
    asuka.addOverlay(entry);
    var group = GroupModel(
      name: controllerName.text,
      describle: controllerDescrible.text,
      date: getDate.toIso8601String(),
      type: getCategory,
      members: getMembers,
      priceMax: controllerPriceMax.text,
      priceMin: controllerPriceMin.text,
    );
    var result = await registersGroup(group);
    entry.remove();
    result.fold((failure) {
      asuka.AsukaSnackbar.warning(failure.message.toString()).show();
    }, (list) {
      clean();
      Modular.to.pushReplacementNamed("/home/");
    });
  }

  void clean() {
    _members.clear();
    _type = null;
    controllerName.clear();
    controllerDescrible.clear();
    controllerPriceMax.clear();
    controllerPriceMin.clear();
    _date = DateTime.now();
    _time = TimeOfDay.now();
  }
}
