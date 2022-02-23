import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/get_groups.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part "groups_list_controller.g.dart";

@Injectable()
class GroupsListController = _GroupsListControllerBase with _$GroupsListController;

abstract class _GroupsListControllerBase with Store {
  final AuthStore user;
  final GetGroups getGroups;

  _GroupsListControllerBase(this.user, this.getGroups) {
    analyticsDefines();
    request();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Home');
  }

  @observable
  bool _buttonExtends = true;

  @computed
  bool get buttonExtends => _buttonExtends;

  @action
  void setExtendsButton(bool value) => _buttonExtends = value;

  @observable
  ObservableList<GroupModel> _groups = ObservableList<GroupModel>.of([]);

  @computed
  bool get isGroups => _groups.isNotEmpty;

  @computed
  int get countGroups => _groups.length;

  @computed
  List<GroupModel> get allGroups => _groups.toList();

  @action
  void add(GroupModel value) => _groups.add(value);

  @action
  void addAll(Iterable<GroupModel> groups) {
    _groups.clear();
    _groups.addAll(groups);
  }

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  Future<void> request() async {
    setLoading(true);
    var result = await getGroups();
    result.fold((failure) {}, (list) {
      addAll(list as Iterable<GroupModel>);
    });
    setLoading(false);
  }

  bool notificationPredicate(ScrollNotification scroll) {
    if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) {
      request();
    }
    setExtendsButton(scroll.metrics.extentAfter > scroll.metrics.extentBefore);
    return true;
  }

  void redirect() => Modular.to.pushNamed("/home/register/members");
}
