import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/notification/domain/repositories/notification_repository.dart';
import 'package:friends_secrets/app/modules/notification/domain/usecases/list_notifications.dart';
import 'package:friends_secrets/app/modules/notification/infra/repositories/notification_repository.dart';
import 'package:friends_secrets/app/modules/notification/presenter/pages/notification_controller.dart';
import 'package:friends_secrets/app/modules/notification/presenter/pages/notification_page.dart';

class NotificationModule extends Module {
  @override
  final List<Bind> binds = [
    // Repositories -----------------------------------------------------------------------------
    Bind.factory<NotificationRepository>((i) => NotificationRepositoryImpl(i.get(), i.get()), export: true),
    // Use Case ---------------------------------------------------------------------------------
    Bind.factory<ListNotifiactions>((i) => ListNotifiactionsImpl(i.get()), export: true),
    // Controllers -------------------------------------------------------------------------------
    Bind.factory((i) => NotificationController(i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const NotificationPage()),
  ];
}
