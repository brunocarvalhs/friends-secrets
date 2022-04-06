import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/localization/generated/l10n.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/show/read/groups_read_controller.dart';
import 'package:friends_secrets/app/modules/groups/presenter/widgets/members_todo.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';
import 'package:friends_secrets/app/shared/widgets/loading_present.dart';

class GroupsReadPage extends StatefulWidget {
  final String id;
  const GroupsReadPage({Key? key, required this.id}) : super(key: key);
  @override
  GroupsReadPageState createState() => GroupsReadPageState();
}

class GroupsReadPageState
    extends ModularState<GroupsReadPage, GroupsReadController> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: controller.request(context),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return const LoadingPresent();
          default:
            return Scaffold(
              body: SafeArea(
                child: NestedScrollView(
                  headerSliverBuilder: (_, b) => [
                    Observer(
                      builder: (_) => AppBarDefault(
                        expandedHeight: 300,
                        actions: [
                          if (controller.getGroup?.author ==
                              Modular.get<AuthStore>().user)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: IconButton(
                                onPressed: () => controller.redirectEdit(),
                                icon: const Icon(Icons.edit),
                              ),
                            ),
                        ],
                        title: controller.getGroup?.name,
                        subtitle: controller.getGroup?.description,
                      ),
                    ),
                  ],
                  body: RefreshIndicator(
                    onRefresh: () => controller.request(context),
                    notificationPredicate: (scrollNotification) => controller
                        .notificationPredicate(scrollNotification, context),
                    child: Observer(builder: (context) {
                      return CustomScrollView(
                        slivers: <Widget>[
                          SliverToBoxAdapter(
                            child: ExpansionTile(
                              title: Text(
                                Modular.get<I10n>()
                                    .groups_groupsReadPage_text_labelDatails,
                                style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              children: <Widget>[
                                if (controller.getGroup?.date != null)
                                  ListTile(
                                    title: Text(
                                      Modular.get<I10n>()
                                          .groups_groupsReadPage_text_dataDatails(
                                        controller.getGroup!.date!.day
                                            .toString(),
                                        controller.getGroup!.date!.month
                                            .toString(),
                                        controller.getGroup!.date!.year
                                            .toString(),
                                        controller.getGroup!.date!.hour
                                            .toString(),
                                        controller.getGroup!.date!.minute
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                if (controller.getGroup?.priceMin != null)
                                  ListTile(
                                    title: Text(
                                      Modular.get<I10n>()
                                          .groups_groupsReadPage_text_priceMinDatails(
                                        controller.getGroup!.priceMin
                                            .toString(),
                                      ),
                                    ),
                                  ),
                                if (controller.getGroup?.priceMax != null)
                                  ListTile(
                                    title: Text(
                                      Modular.get<I10n>()
                                          .groups_groupsReadPage_text_priceMaxDatails(
                                        controller.getGroup!.priceMax
                                            .toString(),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Column(
                              children: [
                                ExpansionTile(
                                  title: Text(
                                    "Tipo: ${controller.getGroup?.type?.name}",
                                    style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  children: <Widget>[
                                    if (controller.getGroup?.type?.image !=
                                        null)
                                      CachedNetworkImage(
                                        imageUrl:
                                            "${controller.getGroup?.type?.image}",
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          height: 200,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: imageProvider,
                                              fit: BoxFit.contain,
                                              alignment: Alignment.center,
                                            ),
                                          ),
                                        ),
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                      ),
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        "${controller.getGroup?.type?.description}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SliverToBoxAdapter(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 10,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    Modular.get<I10n>()
                                        .groups_groupsReadPage_text_labelMembers,
                                  ),
                                  Observer(
                                    builder: (context) => Text(
                                      "${Modular.get<I10n>().groups_groupsReadPage_text_descriptionMembers} ${controller.getGroup?.users?.length ?? 0}",
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          if (controller.isNotDrawn)
                            SliverToBoxAdapter(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () =>
                                        controller.redirectAddMembers(),
                                    child: ListTile(
                                      leading: CircleAvatar(
                                        child: const Icon(
                                          Icons.group_add_rounded,
                                          color: Colors.white,
                                        ),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                      ),
                                      title: Text(Modular.get<I10n>()
                                          .groups_groupsReadPage_text_addMembersTitle),
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
                                        user: controller.getGroup?.users!
                                            .elementAt(index),
                                      ),
                                    ),
                                    Divider(
                                      height: 5,
                                      color: Colors.grey.shade600,
                                    )
                                  ],
                                ),
                                childCount:
                                    controller.getGroup?.users?.length ?? 0,
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
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
                            label: Text(Modular.get<I10n>()
                                .groups_groupsReadPage_text_showDrawnMembersLabel),
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
                                title: Text(Modular.get<I10n>()
                                    .groups_groupsReadPage_alertDialog_title),
                                content: Text(Modular.get<I10n>()
                                    .groups_groupsReadPage_alertDialog_content),
                                actions: [
                                  TextButton(
                                    child: Text(Modular.get<I10n>()
                                        .groups_groupsReadPage_alertDialog_textButton_cancel),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                  TextButton(
                                    child: Text(Modular.get<I10n>()
                                        .groups_groupsReadPage_alertDialog_textButton_next),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      controller.drawMembers(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            label: Text(Modular.get<I10n>()
                                .groups_groupsReadPage_floatingActionButton_label),
                            icon: const Icon(Icons.people_rounded),
                          ),
                        ),
                    ],
                  ),
                );
              }),
            );
        }
      },
    );
  }
}
