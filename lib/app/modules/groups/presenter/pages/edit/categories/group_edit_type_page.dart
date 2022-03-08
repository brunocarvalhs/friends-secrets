import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/create/categories/groups_register_type_controller.dart';
import 'package:friends_secrets/app/modules/groups/presenter/widgets/type_todo.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';

class GroupsRegisterTypePage extends StatefulWidget {
  const GroupsRegisterTypePage({Key? key}) : super(key: key);
  @override
  GroupsRegisterTypePageState createState() => GroupsRegisterTypePageState();
}

class GroupsRegisterTypePageState extends ModularState<GroupsRegisterTypePage, GroupsRegisterTypeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => [
            const AppBarDefault(
              expandedHeight: 300,
              title: "Selecione\na categoria",
              subtitle:
                  "Definimos tipos de amigos secretos que nossa plataforma disponibiliza para nossos usuários poderem se divertir de diversas maneiras diferentes.",
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
                            builder: (context) => TypeTodo(
                              type: controller.allType.elementAt(index),
                              onSelect: (user) => controller.selectType(user),
                              isSelected: controller.isSelectedType(controller.allType.elementAt(index)),
                            ),
                          ),
                          Divider(
                            height: 5,
                            color: Colors.grey.shade600,
                          )
                        ],
                      ),
                      childCount: controller.countType,
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
