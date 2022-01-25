import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../presenter/stores/auth_store.dart';

part 'number_register_controller.g.dart';

@Injectable()
class NumberRegisterController = _NumberRegisterControllerBase with _$NumberRegisterController;

abstract class _NumberRegisterControllerBase with Store {
  final AuthStore authStore;

  _NumberRegisterControllerBase(this.authStore);

  TextEditingController phone = TextEditingController();

  void postPhone() {
    Modular.to.pushNamed("/login/phone/validation");
  }
}
