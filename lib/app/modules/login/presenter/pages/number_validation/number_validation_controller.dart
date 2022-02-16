import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/domain/usecases/register_phone.dart';
import 'package:mobx/mobx.dart';

import '../../../presenter/stores/auth_store.dart';

part 'number_validation_controller.g.dart';

@Injectable()
class NumberValidationController = _NumberValidationControllerBase with _$NumberValidationController;

abstract class _NumberValidationControllerBase with Store {
  final AuthStore authStore;
  final RegisterPhone registerPhone;

  _NumberValidationControllerBase(this.authStore, this.registerPhone);

  final String? phone = Modular.args.queryParams["phone"];
  final String verificadId = Modular.args.data;

  List<TextEditingController> inputs = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  List<FocusNode> focus = [
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
    FocusNode(),
  ];

  Future<void> validation() async {
    final code = inputs.map((e) => e.text).join("");
    final result = await registerPhone(verificadId, code);
    result.fold((l) {}, (r) {
      authStore.setUser(authStore.user?.copyWith(phone: phone));
      redirect();
    });
  }

  void redirect() {
    Modular.to.pushReplacementNamed("/home");
  }
}
