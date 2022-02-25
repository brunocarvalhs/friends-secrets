import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/profile_controller.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/profile_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => ProfileController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ProfilePage()),
  ];
}
