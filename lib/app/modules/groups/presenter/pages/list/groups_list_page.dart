import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:badges/badges.dart';
import 'package:friends_secrets/app/core/localization/generated/l10n.dart';
import 'package:friends_secrets/app/modules/groups/presenter/widgets/group_todo.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/list/groups_list_controller.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:friends_secrets/app/shared/widgets/loading_present.dart';

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
            Observer(builder: (context) {
              return AppBarDefault(
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () => controller.notificationRedirect(),
                      icon: FutureBuilder(
                        future: controller.notificationCheck(context),
                        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return const Icon(Icons.notifications);
                            default:
                              return (controller.notification ?? 0) > 0
                                  ? Badge(
                                      position: BadgePosition.topStart(),
                                      elevation: 0,
                                      badgeContent: Text(
                                        '${controller.notification}',
                                        style: const TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      child: const Icon(Icons.notifications_active),
                                    )
                                  : const Icon(Icons.notifications);
                          }
                        },
                      ),
                    ),
                  ),
                ],
                automaticallyImplyLeading: false,
                expandedHeight: 150,
                onTapTitle: () => controller.profileRedirect(),
                title:
                    "${Modular.get<AuthStore>().getName?.split(" ").first}\n${Modular.get<AuthStore>().getName?.split(" ").last}",
              );
            }),
          ],
          body: FutureBuilder(
            future: controller.request(context),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return const LoadingPresent();
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
                                  GroupTodo(
                                    groupModel: controller.allGroups.elementAt(index),
                                    onTap: (group) => controller.readGroup(group),
                                  ),
                                  Divider(
                                    height: 2,
                                    color: Colors.grey.shade400,
                                  )
                                ],
                              ),
                              childCount: controller.countGroups,
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
          onPressed: () => controller.redirect(),
          label: Text(Modular.get<I10n>().groups_groupsListPage_floatingActionButton_label),
          icon: const Icon(Icons.add),
        ),
      ),
    );
  }
}
