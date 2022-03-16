import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/localization/generated/l10n.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/likers/likers_controller.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';

class LikersPage extends StatefulWidget {
  const LikersPage({Key? key}) : super(key: key);
  @override
  LikersPageState createState() => LikersPageState();
}

class LikersPageState extends ModularState<LikersPage, LikersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => [
            AppBarDefault(
              expandedHeight: 300,
              title: Modular.get<I10n>().profile_likersPage_appBarDefault_title,
              subtitle: Modular.get<I10n>().profile_likersPage_appBarDefault_subtitle,
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
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Observer(
                          builder: (_) => Wrap(
                            spacing: 10,
                            children: controller.allItems
                                .map((item) => Observer(builder: (context) {
                                      return FilterChip(
                                        label: Text('${item.name}'),
                                        padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                                        selected: controller.isSelectedLike(item),
                                        onSelected: (select) =>
                                            select ? controller.selecLike(item) : controller.removeLike(item),
                                      );
                                    }))
                                .toList(),
                          ),
                        ),
                      ),
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
          onPressed: () => controller.save(context),
          label: Text(Modular.get<I10n>().profile_likersPage_floatingActionButton_label),
          icon: const Icon(Icons.save),
        ),
      ),
    );
  }
}
