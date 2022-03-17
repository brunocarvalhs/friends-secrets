import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/localization/generated/l10n.dart';
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
            AppBarDefault(
              expandedHeight: 300,
              title: Modular.get<I10n>().groups_groupsRegisterTypePage_appBarDefault_title,
              subtitle: Modular.get<I10n>().groups_groupsRegisterTypePage_appBarDefault_subtitle,
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
          label: Text(Modular.get<I10n>().groups_groupsRegisterTypePage_floatingActionButton_label),
          icon: const Icon(Icons.arrow_right),
        ),
      ),
    );
  }
}
