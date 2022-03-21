import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:uni_links/uni_links.dart';

part "splash_controller.g.dart";

@Injectable()
class SplashController = _SplashControllerBase with _$SplashController;

abstract class _SplashControllerBase with Store {
  _SplashControllerBase() {
    validationUserAuth();
    initDeeplink();
  }

  void validationUserAuth() {
    Modular.get<AuthStore>().checkLogin().then((isLogged) async {
      String redirect = "/login/";
      if (isLogged) {
        if (Modular.get<AuthStore>().user?.phone != null && Modular.get<AuthStore>().user?.likers != null) {
          redirect = "/home/";
        } else if (Modular.get<AuthStore>().user?.phone == null) {
          redirect = "/login/phone";
        } else if (Modular.get<AuthStore>().user?.likers == null) {
          redirect = "/profile/likers";
        }
      }
      Modular.to.pushReplacementNamed(redirect);
    });
  }

  Future<void> initDeeplink() async {
    final uri = await getInitialUri();
    if (uri != null) {
      Modular.to.pushNamed("/${uri.host}/${uri.pathSegments.join('')}");
    }
  }
}
