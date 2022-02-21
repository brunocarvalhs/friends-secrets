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
  GroupModel _groupModel = Modular.args.data;

  @action
  void setGroup(GroupModel value) => _groupModel = value;

  @computed
  GroupModel get getGroup => _groupModel;

  @observable
  bool _buttonExtends = true;

  @computed
  bool get buttonExtends => _buttonExtends;

  @action
  void setExtendsButton(bool value) => _buttonExtends = value;

  @observable
  ObservableList<GroupModel> _groups = ObservableList<GroupModel>.of([]);

  Future<void> request() async {}

  bool notificationPredicate(ScrollNotification scroll) {
    if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) {
      request();
    }
    setExtendsButton(scroll.metrics.extentAfter > scroll.metrics.extentBefore);
    return true;
  }

  void redirect() {}
}
