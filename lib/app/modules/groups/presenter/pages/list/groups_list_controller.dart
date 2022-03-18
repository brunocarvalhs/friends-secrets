import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/delete_group.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/exit_group.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/get_groups.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/shared_group.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:friends_secrets/app/modules/notification/domain/usecases/list_notifications.dart';
import 'package:mobx/mobx.dart';

part "groups_list_controller.g.dart";

@Injectable()
class GroupsListController = _GroupsListControllerBase with _$GroupsListController;

abstract class _GroupsListControllerBase with Store {
  final AuthStore user;
  final GetGroups getGroups;
  final ListNotifiactions notifiactions;
  final ExitGroup exitGroup;
  final DeleteGroup deleteGroup;
  final SharedGroup sharedGroup;

  _GroupsListControllerBase(
    this.user,
    this.getGroups,
    this.notifiactions,
    this.deleteGroup,
    this.sharedGroup,
    this.exitGroup,
  ) {
    analyticsDefines();
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
  int? notification;

  Future<void> request(BuildContext context) async {
    final result = await getGroups();
    result.fold((failure) {}, (list) {
      addAll(list as Iterable<GroupModel>);
    });
  }

  Future<void> notificationCheck(BuildContext context) async {
    final result = await notifiactions();
    result.fold((failure) {}, (list) {
      notification = list.map((notification) {
        if (notification.isVisualized) return notification;
      }).length;
    });
  }

  bool notificationPredicate(ScrollNotification scroll) {
    setExtendsButton(scroll.metrics.extentAfter > scroll.metrics.extentBefore);
    return true;
  }

  void redirect() => Modular.to.pushNamed("/home/register/members");

  void profileRedirect() => Modular.to.pushNamed("/profile/");

  void notificationRedirect() => Modular.to.pushNamed("/notification/");

  void readGroup(GroupModel groupModel) => Modular.to.pushNamed("/home/${groupModel.id}", arguments: groupModel);

  Future<void> delete(GroupModel groupModel) async {
    final result = groupModel.author == Modular.get<AuthStore>().user
        ? await deleteGroup(groupModel.id!)
        : await exitGroup(groupModel.id!);
    result.fold((failure) {}, (seccess) {});
  }

  Future<void> shared(GroupModel groupModel) async {
    final result = await sharedGroup(groupModel.id!);
    result.fold((failure) {}, (seccess) {});
  }
}
