import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/likers/likers_controller.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/likers/likers_page.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/profile/profile_controller.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/profile/profile_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => ProfileController(i.get())),
    Bind.factory((i) => LikersController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ProfilePage()),
    ChildRoute("/likers", child: (_, args) => const LikersPage()),
  ];
}
