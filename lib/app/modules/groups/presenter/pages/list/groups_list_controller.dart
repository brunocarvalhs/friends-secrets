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
  final GetGroups _getGroups;
  final ListNotifiactions _notifiactions;
  final ExitGroup _exitGroup;
  final DeleteGroup _deleteGroup;
  final SharedGroup _sharedGroup;

  _GroupsListControllerBase(
    this._getGroups,
    this._notifiactions,
    this._deleteGroup,
    this._sharedGroup,
    this._exitGroup,
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
  // ignore: prefer_final_fields
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
    final result = await _getGroups();
    result.fold((failure) {}, (list) {
      addAll(list as Iterable<GroupModel>);
    });
  }

  Future<void> notificationCheck(BuildContext context) async {
    final result = await _notifiactions();
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

  void redirect() => Modular.to.pushNamed("/home/register/members").then(((value) => update()));

  void profileRedirect() => Modular.to.pushNamed("/profile/").then(((value) => update()));

  void notificationRedirect() => Modular.to.pushNamed("/notification/").then(((value) => update()));

  void readGroup(GroupModel groupModel) =>
      Modular.to.pushNamed("/home/${groupModel.id}", arguments: groupModel).then(((value) => update()));

  Future<void> update() async {
    final groups = await _getGroups();
    groups.fold((failure) {}, (list) {
      addAll(list as Iterable<GroupModel>);
    });
    final notifications = await _notifiactions();
    notifications.fold((failure) {}, (list) {
      notification = list.map((notification) {
        if (notification.isVisualized) return notification;
      }).length;
    });
  }

  Future<void> delete(GroupModel groupModel) async {
    final result = groupModel.author == Modular.get<AuthStore>().user
        ? await _deleteGroup(groupModel.id!)
        : await _exitGroup(groupModel.id!);
    result.fold((failure) {}, (seccess) {});
  }

  Future<void> shared(GroupModel groupModel) async {
    final result = await _sharedGroup(groupModel.id!);
    result.fold((failure) {}, (seccess) {});
  }
}
