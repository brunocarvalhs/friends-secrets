import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/domain/usecases/register_phone.dart';
import 'package:mobx/mobx.dart';

import '../../../presenter/stores/auth_store.dart';

part 'number_register_controller.g.dart';

@Injectable()
class NumberRegisterController = _NumberRegisterControllerBase with _$NumberRegisterController;

abstract class _NumberRegisterControllerBase with Store {
  final AuthStore authStore;
  final RegisterPhone registerPhone;

  _NumberRegisterControllerBase(this.authStore, this.registerPhone);

  TextEditingController phone = TextEditingController();

  Future<void> postPhone() async {
    final result = await registerPhone(phone.text.toString());
    result.fold((l) => {}, (r) => {redirectValidation()});
  }

  void redirectValidation() => Modular.to.pushNamed("/login/phone/validation", arguments: phone.text);
}
