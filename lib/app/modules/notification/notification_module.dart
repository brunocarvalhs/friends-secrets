import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/notification/presenter/pages/notification_controller.dart';
import 'package:friends_secrets/app/modules/notification/presenter/pages/notification_page.dart';

class NotificationModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => NotificationController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const NotificationPage()),
  ];
}
