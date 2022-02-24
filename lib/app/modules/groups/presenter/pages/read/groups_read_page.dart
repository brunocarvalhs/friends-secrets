import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/read/groups_read_controller.dart';
import 'package:friends_secrets/app/modules/groups/presenter/widgets/members_todo.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
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
                title: controller.getGroup?.name,
                subtitle: controller.getGroup?.description,
              ),
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
                        builder: (context) => MembersTodo(
                          user: controller.getGroup?.users![index],
                        ),
                      ),
                      childCount: controller.getGroup?.users?.length ?? 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Observer(
        builder: (_) => Visibility(
          visible: controller.getGroup?.author == Modular.get<AuthStore>().user,
          child: FloatingActionButton.extended(
            isExtended: controller.buttonExtends,
            onPressed: () => true ? controller.redirect() : controller.redirect(),
            label: const Text(true ? "Sortear" : "Ver amigo secreto"),
            icon: const Icon(true ? Icons.people_rounded : Icons.person),
          ),
        ),
      ),
    );
  }
}
