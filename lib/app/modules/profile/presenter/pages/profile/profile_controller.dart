import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part "profile_controller.g.dart";

@Injectable()
class ProfileController = _ProfileControllerBase with _$ProfileController;

abstract class _ProfileControllerBase with Store {
  final AuthStore authStore;

  _ProfileControllerBase(this.authStore) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>()
        .setCurrentScreen(screenName: 'Profile');
  }

  Future<void> signOut(BuildContext context) async {
    final result = await authStore.signOut(context);
    if (result) {
      Modular.to.navigate("/login/");
    }
  }

  Future<void> request(BuildContext context) async =>
      await authStore.refresh(context);

  Future<void> editLikert() => Modular.to.pushNamed("/profile/likers");
}
