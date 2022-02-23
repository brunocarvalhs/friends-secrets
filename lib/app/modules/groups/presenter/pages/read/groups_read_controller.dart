import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/read_group.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part "groups_read_controller.g.dart";

@Injectable()
class GroupsReadController = _GroupsReadControllerBase with _$GroupsReadController;

abstract class _GroupsReadControllerBase with Store {
  final AuthStore user;
  final ReadGroup readGroup;

  _GroupsReadControllerBase(this.user, this.readGroup) {
    request();
  }

  @observable
  GroupModel? _groupModel;

  @action
  void setGroup(GroupModel value) => _groupModel = value;

  @computed
  GroupModel? get getGroup => _groupModel;

  @observable
  bool _buttonExtends = true;

  @computed
  bool get buttonExtends => _buttonExtends;

  @action
  void setExtendsButton(bool value) => _buttonExtends = value;

  Future<void> request() async {
    var result = await readGroup(Modular.args.params["uuid"]);
    result.fold((failure) {}, (group) {
      setGroup(group as GroupModel);
    });
  }

  bool notificationPredicate(ScrollNotification scroll) {
    if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) {
      request();
    }
    setExtendsButton(scroll.metrics.extentAfter > scroll.metrics.extentBefore);
    return true;
  }

  void redirect() {}
}
