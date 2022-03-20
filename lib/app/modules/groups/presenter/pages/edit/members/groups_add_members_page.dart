import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/localization/generated/l10n.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/edit/members/groups_add_members_controller.dart';
import 'package:friends_secrets/app/modules/groups/presenter/widgets/contact_todo.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';
import 'package:friends_secrets/app/shared/widgets/loading_present.dart';

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
            AppBarDefault(
              expandedHeight: 300,
              title: Modular.get<I10n>().groups_groupsAddMembersPage_appBarDefault_title,
              subtitle: Modular.get<I10n>().groups_groupsAddMembersPage_appBarDefault_subtitle,
            ),
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
          onPressed: () => controller.update(context),
          label: Text(Modular.get<I10n>().groups_groupsAddMembersPage_floatingActionButton_label),
          icon: const Icon(Icons.save),
        ),
      ),
    );
  }
}
