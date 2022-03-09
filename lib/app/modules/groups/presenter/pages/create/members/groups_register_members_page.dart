import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/widgets/contact_todo.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/create/members/groups_register_members_controller.dart';

class GroupsRegisterMembersPage extends StatefulWidget {
  const GroupsRegisterMembersPage({Key? key}) : super(key: key);
  @override
  GroupsRegisterMembersPageState createState() => GroupsRegisterMembersPageState();
}

class GroupsRegisterMembersPageState extends ModularState<GroupsRegisterMembersPage, GroupsRegisterMembersController> {
  @override
  void initState() {
    controller.request();
    super.initState();
  }

  @override
  void dispose() {
    controller.clear();
    super.dispose();
  }

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
          body: RefreshIndicator(
            onRefresh: () => controller.request(),
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
                              onSelect: (user) => controller.selectContact(user),
                              onRemove: (user) => controller.removeContact(user),
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
          ),
        ),
      ),
      floatingActionButton: Observer(
        builder: (_) => FloatingActionButton.extended(
          isExtended: controller.buttonExtends,
          onPressed: () => controller.redirect(),
          label: const Text("Continuar"),
          icon: const Icon(Icons.arrow_right),
        ),
      ),
    );
  }
}
