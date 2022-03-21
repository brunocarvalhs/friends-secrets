import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/notification/domain/usecases/list_notifications.dart';
import 'package:friends_secrets/app/modules/notification/infra/models/notification_model.dart';
import 'package:mobx/mobx.dart';

part "notification_controller.g.dart";

@Injectable()
class NotificationController = _NotificationControllerBase with _$NotificationController;

abstract class _NotificationControllerBase with Store {
  final ListNotifiactions _listNotifiactions;

  _NotificationControllerBase(this._listNotifiactions) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Notification');
  }

  @observable
  ObservableList<NotificationModel> _listNotifications = ObservableList<NotificationModel>.of([]);

  @computed
  bool get isNotifications => _listNotifications.isNotEmpty;

  @computed
  int get countNotifications => _listNotifications.length;

  @computed
  List<NotificationModel> get allNotifications => _listNotifications.toList();

  @action
  void add(NotificationModel value) => _listNotifications.add(value);

  @action
  void addAll(Iterable<NotificationModel> notifications) {
    _listNotifications.clear();
    _listNotifications.addAll(notifications);
  }

  Future<void> request(BuildContext context) async {
    var result = await _listNotifiactions();
    result.fold((failure) {}, (list) {
      addAll(list as Iterable<NotificationModel>);
    });
  }
}
