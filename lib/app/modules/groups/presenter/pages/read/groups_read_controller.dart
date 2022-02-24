import 'package:firebase_analytics/firebase_analytics.dart';
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
    analyticsDefines();
    request();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Group Read');
    await Modular.get<FirebaseAnalytics>().logEvent(name: 'view_group', parameters: {
      'group_id': Modular.args.params["id"],
    });
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
    var result = await readGroup(Modular.args.params["id"]);
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
