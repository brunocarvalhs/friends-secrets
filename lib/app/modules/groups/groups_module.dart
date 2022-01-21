import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/list/groups_list_controller.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/list/groups_list_page.dart';

class GroupsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => GroupsListController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const GroupsListPage()),
  ];
}
