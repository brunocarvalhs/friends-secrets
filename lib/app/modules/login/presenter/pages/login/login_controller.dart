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
    await Future.delayed(const Duration(seconds: 1));
    var result = await loginWithGoogleUsecase();
    result.fold((failure) {}, (user) {
      authStore.setUser(user);
      Modular.to.pushReplacementNamed("/events");
    });
  }
}
