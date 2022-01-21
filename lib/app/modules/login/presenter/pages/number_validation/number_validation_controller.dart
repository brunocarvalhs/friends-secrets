import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../presenter/stores/auth_store.dart';

part 'number_validation_controller.g.dart';

@Injectable()
class NumberValidationController = _NumberValidationControllerBase with _$NumberValidationController;

abstract class _NumberValidationControllerBase with Store {
  final AuthStore authStore;

  _NumberValidationControllerBase(this.authStore);

  List<TextEditingController> inputs = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
}
