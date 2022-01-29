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
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => [
            const AppBarDefault(
              expandedHeight: 300,
              title: "Registro de \nTelefone",
              subtitle: "Cadastrando seu telefone, o organizador\ndo grupo, poderá te incluir no amigo\nsecreto.",
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
                      (BuildContext context, int index) => Observer(
                        builder: (context) => ContactTodo(
                          user: controller.allContacts[index],
                          onSelect: (user) => controller.selectContact(user),
                          onRemove: (user) => controller.removeContact(user),
                          isSelected: controller.isSelectedContact(controller.allContacts[index]),
                        ),
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
