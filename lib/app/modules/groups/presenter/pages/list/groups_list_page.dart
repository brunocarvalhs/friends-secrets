import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/list/groups_list_controller.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';

class GroupsListPage extends StatefulWidget {
  const GroupsListPage({Key? key}) : super(key: key);
  @override
  GroupsListPageState createState() => GroupsListPageState();
}

class GroupsListPageState extends ModularState<GroupsListPage, GroupsListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => [
            AppBarDefault(
              actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications))],
              automaticallyImplyLeading: false,
              expandedHeight: 150,
              title:
                  "${Modular.get<AuthStore>().getName?.split(" ").first}\n${Modular.get<AuthStore>().getName?.split(" ").last}",
            ),
          ],
          body: RefreshIndicator(
            onRefresh: () => controller.request(),
            notificationPredicate: (scrollNotification) => controller.notificationPredicate(scrollNotification),
            child: CustomScrollView(
              slivers: <Widget>[
                Observer(
                  builder: (_) => SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) => Card(
                        clipBehavior: Clip.antiAlias,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text("${controller.allGroups[index].name}"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("${controller.allGroups[index].describle}"),
                            ),
                          ],
                        ),
                      ),
                      childCount: controller.countGroups,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Observer(
        builder: (_) => FloatingActionButton.extended(
          isExtended: controller.buttonExtends,
          onPressed: () => controller.redirect(),
          label: const Text("Criar Grupo"),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
