import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
        child: RefreshIndicator(
          onRefresh: () => controller.request(),
          notificationPredicate: (scrollNotification) => controller.notificationPredicate(scrollNotification),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                expandedHeight: 400,
                automaticallyImplyLeading: false,
                flexibleSpace: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Registro de \nTelefone",
                              style: Theme.of(context).textTheme.headline1,
                            ),
                            const SizedBox(height: 20),
                            Text(
                              "Cadastrando seu telefone, o organizador\ndo grupo, poderá te incluir no amigo\nsecreto.",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Observer(
                builder: (_) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) => Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          ListTile(
                            leading: const CircleAvatar(),
                            title: Text("${controller.allContacts[index].name}"),
                          ),
                        ],
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
