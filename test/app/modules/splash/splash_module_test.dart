import 'package:flutter_test/flutter_test.dart';
import 'package:friends_secrets/app/modules/splash/splash_module.dart';
import 'package:modular_test/modular_test.dart';

void main() {
  setUpAll(() {
    initModule(SplashModule());
  });
}
