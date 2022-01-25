import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/register_group.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';

import 'package:mobx/mobx.dart';

part 'register_group_store.g.dart';

class RegisterGroupStore = _RegisterGroupStoreBase with _$RegisterGroupStore;

abstract class _RegisterGroupStoreBase with Store {
  final RegistersGroup registersGroup;

  _RegisterGroupStoreBase(this.registersGroup);

  // Type ---------------------------------------------

  @observable
  TypeModel? _type;

  @action
  void setType(TypeModel? value) => _type = value;

  @computed
  TypeModel? get getCategory => _type;

  // Members ------------------------------------------

  @observable
  ObservableList<UserModel> _members = ObservableList<UserModel>.of([]);

  @action
  void addMember(UserModel value) => _members.add(value);

  @action
  void removeMember(UserModel value) => _members.remove(value);

  @computed
  List<UserModel>? get getMembers => _members;

  // Data ----------------------------------------------

  @observable
  String? _name;

  @action
  void setName(String? value) => _name = value;

  @computed
  String get getName => _name ?? "";

  @observable
  String? _discrible;

  @action
  void setDiscrible(String? value) => _discrible = value;

  @computed
  String get getDiscrible => _discrible ?? "";

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

  @observable
  TimeOfDay _time = TimeOfDay.now();

  @action
  void setTime(TimeOfDay? time) => _time = time ?? TimeOfDay.now();

  Future<void> register() async {
    var group = GroupModel(
      name: getName,
      describle: getDiscrible,
      date: getDate.toIso8601String(),
    );
    var result = await registersGroup(group);
    result.fold((failure) {}, (list) {
      clear();
      Modular.to.navigate("/home/");
    });
  }

  void clear() {
    setName(null);
    setDiscrible(null);
  }
}
