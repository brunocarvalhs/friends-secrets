import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/splash/presenter/pages/splash_controller.dart';
import 'package:friends_secrets/app/modules/splash/presenter/pages/splash_page.dart';

class SplashModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => SplashController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const SplashPage()),
  ];
}
