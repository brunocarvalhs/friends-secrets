import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part "notification_controller.g.dart";

@Injectable()
class NotificationController = _NotificationControllerBase with _$NotificationController;

abstract class _NotificationControllerBase with Store {
  final AuthStore authStore;

  _NotificationControllerBase(this.authStore) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Notification');
  }

  Future<void> signOut() async {
    await authStore.signOut();
    Modular.to.pop("/login/");
  }
}
