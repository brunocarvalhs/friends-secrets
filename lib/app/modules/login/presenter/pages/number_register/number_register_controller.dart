import 'package:asuka/asuka.dart' as asuka;
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/domain/usecases/validation_phone.dart';
import 'package:friends_secrets/app/shared/widgets/loading_default.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mobx/mobx.dart';

import '../../../presenter/stores/auth_store.dart';

part 'number_register_controller.g.dart';

@Injectable()
class NumberRegisterController = _NumberRegisterControllerBase with _$NumberRegisterController;

abstract class _NumberRegisterControllerBase with Store {
  final AuthStore authStore;
  final ValidationPhone validationPhone;

  _NumberRegisterControllerBase(this.authStore, this.validationPhone) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Number Register');
  }

  TextEditingController phone = TextEditingController();
  final maskFormatter = MaskTextInputFormatter(
    mask: '(##) # ####-####',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final formKey = GlobalKey<FormState>();

  Future<void> postPhone() async {
    if (!formKey.currentState!.validate()) return;
    var entry = OverlayEntry(builder: (context) => const LoadingDefault());
    asuka.addOverlay(entry);
    final result = await validationPhone(maskFormatter.getUnmaskedText());
    entry.remove();
    result.fold((error) {
      asuka.AsukaSnackbar.message(error.message.toString()).show();
    }, (validationId) {
      redirectValidation(maskFormatter.getUnmaskedText(), validationId);
    });
  }

  String? validateNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    return null;
  }

  void redirectValidation(String phone, String? validationId) =>
      Modular.to.pushNamed("/login/phone/$phone.text", arguments: validationId);
}
