import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part "likers_controller.g.dart";

@Injectable()
class LikersController = _LikersControllerBase with _$LikersController;

abstract class _LikersControllerBase with Store {
  final AuthStore authStore;

  _LikersControllerBase(this.authStore) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Likers');
  }

  @observable
  bool _buttonExtends = true;

  @computed
  bool get buttonExtends => _buttonExtends;

  @action
  void setExtendsButton(bool value) => _buttonExtends = value;

  bool notificationPredicate(ScrollNotification scroll) {
    setExtendsButton(scroll.metrics.extentAfter > scroll.metrics.extentBefore);
    return true;
  }

  @observable
  ObservableList<dynamic> _likers = ObservableList<dynamic>.of((Modular.args.data as UserModel).likers?.toList() ?? []);

  @action
  void addMember(dynamic value) => _likers.add(value);

  @action
  void removeMember(dynamic value) => _likers.remove(value);

  bool isSelectedContact(dynamic user) {
    return _likers.contains(user);
  }

  @computed
  bool get isLikers => _likers.isNotEmpty;

  @computed
  int get countLikers => _likers.length;

  @computed
  List<dynamic> get allLikers => _likers.toList();

  @action
  void add(dynamic value) => _likers.add(value);

  @action
  void addAll(Iterable<dynamic> contacts) {
    _likers.clear();
    _likers.addAll(contacts);
  }

  Future<void> request() async {}

  Future<void> save() async {}
}
