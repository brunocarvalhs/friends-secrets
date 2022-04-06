import 'package:asuka/asuka.dart' as asuka;
import 'package:edge_alerts/edge_alerts.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/drawn_group.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/read_group.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/show_user_drawn_group.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:friends_secrets/app/shared/widgets/loading_default.dart';
import 'package:mobx/mobx.dart';

part "groups_read_controller.g.dart";

@Injectable()
class GroupsReadController = _GroupsReadControllerBase
    with _$GroupsReadController;

abstract class _GroupsReadControllerBase with Store {
  final ReadGroup readGroup;
  final DrawnGroup drawnGroup;
  final ShowUserDrawnGroup showUserDrawnGroup;

  _GroupsReadControllerBase(
      this.readGroup, this.drawnGroup, this.showUserDrawnGroup) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>()
        .setCurrentScreen(screenName: 'Group Read');
    await Modular.get<FirebaseAnalytics>()
        .logEvent(name: 'view_group', parameters: {
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

  @computed
  bool get isVisibilityDrawn =>
      getGroup?.author == Modular.get<AuthStore>().user &&
      getGroup!.users!.length >= 3;

  @observable
  bool _drawn = false;

  @action
  void setDrawn(bool value) => _drawn = value;

  @computed
  bool get isDrawn => _drawn;

  @computed
  bool get isNotDrawn => !_drawn;

  @action
  void setExtendsButton(bool value) => _buttonExtends = value;

  Future<void> request(BuildContext context) async {
    var result = await readGroup(Modular.args.params["id"]);
    result.fold((failure) {
      edgeAlert(
        context,
        title: failure.title.toString(),
        description: failure.message.toString(),
        backgroundColor: failure.color,
        duration: const Duration(seconds: 10).inSeconds,
      );
    }, (group) {
      setDrawn(group.isDrawns);
      setGroup(group as GroupModel);
    });
  }

  bool notificationPredicate(ScrollNotification scroll, BuildContext context) {
    setExtendsButton(scroll.metrics.extentAfter > scroll.metrics.extentBefore);
    return true;
  }

  void redirectShowDrawn() => Modular.to
      .pushNamed("/home/${Modular.args.params["id"]}/drawn",
          arguments: getGroup)
      .then((value) => update());

  void redirectAddMembers() => Modular.to
      .pushNamed("/home/${Modular.args.params["id"]}/members",
          arguments: getGroup)
      .then((value) => update());

  void redirectEdit() => Modular.to
      .pushNamed("/home/${Modular.args.params["id"]}/edit", arguments: getGroup)
      .then((value) => update());

  Future<void> update() async {
    var result = await readGroup(Modular.args.params["id"]);
    result.fold((failure) {}, (group) {
      setDrawn(group.isDrawns);
      setGroup(group as GroupModel);
    });
  }

  Future<void> drawMembers(BuildContext context) async {
    var entry = OverlayEntry(builder: (context) => const LoadingDefault());
    asuka.addOverlay(entry);
    var result = await drawnGroup(Modular.args.params["id"]);
    entry.remove();
    result.fold((failure) {
      edgeAlert(
        context,
        title: failure.title.toString(),
        description: failure.message.toString(),
        backgroundColor: failure.color,
        duration: const Duration(seconds: 10).inSeconds,
      );
    }, (success) {
      request(context);
      edgeAlert(
        context,
        title: "Sucesso",
        description: "Sorteio realizado com sucesso.",
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5).inSeconds,
      );
    });
  }
}
