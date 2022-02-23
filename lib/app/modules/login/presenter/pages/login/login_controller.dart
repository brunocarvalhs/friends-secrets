import 'package:asuka/asuka.dart' as asuka;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/shared/widgets/loading_default.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/usecases/login_with_google.dart';
import '../../../presenter/stores/auth_store.dart';

part "login_controller.g.dart";

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithGoogle loginWithGoogleUsecase;
  final AuthStore authStore;

  _LoginControllerBase(this.loginWithGoogleUsecase, this.authStore) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Login');
  }

  enterGoogle() async {
    var entry = OverlayEntry(builder: (context) => const LoadingDefault());
    asuka.addOverlay(entry);
    var result = await loginWithGoogleUsecase();
    entry.remove();
    result.fold((failure) async {
      asuka.AsukaSnackbar.warning(failure.message.toString()).show();
    }, (user) async {
      authStore.setUser(user);
      if (user.phone != null) {
        Modular.to.pushReplacementNamed("/home");
      } else {
        Modular.to.pushReplacementNamed("/login/phone");
      }
    });
  }
}
