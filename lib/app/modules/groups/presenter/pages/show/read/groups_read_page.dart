import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/show/read/groups_read_controller.dart';
import 'package:friends_secrets/app/modules/groups/presenter/widgets/members_todo.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';

class GroupsReadPage extends StatefulWidget {
  final String id;
  const GroupsReadPage({Key? key, required this.id}) : super(key: key);
  @override
  GroupsReadPageState createState() => GroupsReadPageState();
}

class GroupsReadPageState extends ModularState<GroupsReadPage, GroupsReadController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => [
            Observer(
              builder: (_) => AppBarDefault(
                expandedHeight: 300,
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                ],
                title: controller.getGroup?.name,
                subtitle: controller.getGroup?.description,
              ),
            ),
          ],
          body: FutureBuilder(
            future: controller.request(context),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                default:
                  return RefreshIndicator(
                    onRefresh: () => controller.request(context),
                    notificationPredicate: (scrollNotification) =>
                        controller.notificationPredicate(scrollNotification, context),
                    child: Observer(builder: (context) {
                      return CustomScrollView(
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Membros",
                                  ),
                                  Observer(builder: (context) {
                                    return Text(
                                      "Total ${controller.getGroup?.users?.length ?? 0}",
                                    );
                                  }),
                                ],
                              ),
                            ),
                          ),
                          if (controller.isVisibilityDrawn && controller.isDrawn)
                            SliverToBoxAdapter(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () => controller.redirectAddMembers(),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        child: const Icon(
                                          Icons.group_add_rounded,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: Theme.of(context).colorScheme.primary,
                                      ),
                                      title: const Text("Adicionar novos membros"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Observer(
                            builder: (_) => SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) => Column(
                                  children: <Widget>[
                                    Observer(
                                      builder: (context) => MembersTodo(
                                        user: controller.getGroup?.users!.elementAt(index),
                                      ),
                                    ),
                                    Divider(
                                      height: 5,
                                      color: Colors.grey.shade600,
                                    )
                                  ],
                                ),
                                childCount: controller.getGroup?.users?.length ?? 0,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  );
              }
            },
          ),
        ),
      ),
      floatingActionButton: Observer(builder: (context) {
        return Visibility(
          visible: controller.getGroup != null,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              if (controller.isDrawn)
                Observer(
                  builder: (_) => FloatingActionButton.extended(
                    isExtended: controller.buttonExtends,
                    onPressed: () => controller.redirectShowDrawn(),
                    label: const Text("Ver amigo secreto"),
                    icon: const Icon(Icons.person),
                  ),
                ),
              const SizedBox(
                height: 10,
              ),
              if (controller.isVisibilityDrawn && !controller.isDrawn)
                Observer(
                  builder: (_) => FloatingActionButton.extended(
                    isExtended: controller.buttonExtends,
                    onPressed: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Realização do sorteio"),
                        content: const Text(
                            "O sorteio e realizado uma unica vez por grupo, esse processo não pode ser desfeito, deseja continuar o sorteio?"),
                        actions: [
                          TextButton(
                            child: const Text("Cancelar"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          TextButton(
                            child: const Text("Continar"),
                            onPressed: () {
                              Navigator.of(context).pop();
                              controller.drawMembers(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    label: const Text("Sortear"),
                    icon: const Icon(Icons.people_rounded),
                  ),
                ),
            ],
          ),
        );
      }),
    );
  }
}
