// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friends_secrets/app/app_module.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:modular_test/modular_test.dart';


void main() {setUpAll(() {
    initModule(AppModule());
  });

  group("AppModule - ", () {
    test("get global instance AuthStore", () {
      final result = Modular.get<AuthStore>();
      expect(result, isA<AuthStore>());
    });
  });
}
