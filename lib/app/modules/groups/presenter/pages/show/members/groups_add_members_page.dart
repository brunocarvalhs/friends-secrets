import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/show/members/groups_add_members_controller.dart';
import 'package:friends_secrets/app/modules/groups/presenter/widgets/contact_todo.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';

class GroupsAddMembersPage extends StatefulWidget {
  final String id;
  const GroupsAddMembersPage({Key? key, required this.id}) : super(key: key);
  @override
  GroupsAddMembersPageState createState() => GroupsAddMembersPageState();
}

class GroupsAddMembersPageState extends ModularState<GroupsAddMembersPage, GroupsAddMembersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => [
            const AppBarDefault(
              expandedHeight: 300,
              title: "Selecione\nos membros",
              subtitle:
                  "Com base na sua lista de contatos,\nlistamos os usuários que tem vinculo no aplicativo, assim facilitando ao selecionar seus membros do amigo secreto.",
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
                    notificationPredicate: (scrollNotification) => controller.notificationPredicate(scrollNotification),
                    child: CustomScrollView(
                      slivers: <Widget>[
                        Observer(
                          builder: (_) => SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) => Column(
                                children: <Widget>[
                                  Observer(
                                    builder: (context) => ContactTodo(
                                      user: controller.allContacts.elementAt(index),
                                      onSelect: (user) => controller.addMember(user),
                                      onRemove: (user) => controller.removeMember(user),
                                      isSelected: controller.isSelectedContact(controller.allContacts.elementAt(index)),
                                    ),
                                  ),
                                  Divider(
                                    height: 5,
                                    color: Colors.grey.shade600,
                                  )
                                ],
                              ),
                              childCount: controller.countContacts,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
              }
            },
          ),
        ),
      ),
      floatingActionButton: Observer(
        builder: (_) => FloatingActionButton.extended(
          isExtended: controller.buttonExtends,
          onPressed: () => controller.save(),
          label: const Text("Adicionar"),
          icon: const Icon(Icons.save),
        ),
      ),
    );
  }
}
