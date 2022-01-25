import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/usecases/login_with_google.dart';
import '../../../presenter/stores/auth_store.dart';

part "login_controller.g.dart";

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginWithGoogle loginWithGoogleUsecase;
  final AuthStore authStore;

  _LoginControllerBase(this.loginWithGoogleUsecase, this.authStore);

  enterGoogle() async {
    var entry = OverlayEntry(
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    asuka.addOverlay(entry);
    var result = await loginWithGoogleUsecase();
    entry.remove();
    result.fold((failure) {
      asuka.AsukaSnackbar.warning(failure.message.toString());
    }, (user) {
      authStore.setUser(user);
      if (user.phone != null) {
        Modular.to.pushReplacementNamed("/home");
      } else {
        Modular.to.pushReplacementNamed("/login/phone");
      }
    });
  }
}
