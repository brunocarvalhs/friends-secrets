import 'dart:async';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';

part "splash_controller.g.dart";

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  _SplashControllerBase() {
    validationUserAuth();
  }

  void validationUserAuth() {
    Timer(const Duration(seconds: 5), () {
      Modular.get<AuthStore>().checkLogin().then((isLogged) async {
        if (isLogged) {
          Modular.to.pushReplacementNamed(Modular.get<AuthStore>().user?.phone != null ? "/home" : "/login/phone");
        } else {
          Modular.to.pushReplacementNamed("/login");
        }
      });
    });
  }
}
