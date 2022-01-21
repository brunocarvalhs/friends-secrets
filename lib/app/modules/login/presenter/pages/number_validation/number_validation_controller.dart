import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/usecases/login_with_google.dart';
import '../../../presenter/stores/auth_store.dart';

part 'number_validation_controller.g.dart';

@Injectable()
class NumberValidationController = _NumberValidationControllerBase with _$NumberValidationController;

abstract class _NumberValidationControllerBase with Store {
  final AuthStore authStore;

  _NumberValidationControllerBase(this.authStore);
}
