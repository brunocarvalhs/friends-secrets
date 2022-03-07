import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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
            const AppBarDefault(
              expandedHeight: 300,
              title: "Criação de\ngostos",
              subtitle:
                  "Para que seu amigo secreto saiba seus\ngostos, nos disponibilizamos uma lista\nde coisas que gosta.",
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
                          Observer(builder: (context) => Column()),
                          Divider(
                            height: 5,
                            color: Colors.grey.shade600,
                          )
                        ],
                      ),
                      childCount: controller.countLikers,
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
          onPressed: () => controller.save(),
          label: const Text("Salvar"),
          icon: const Icon(Icons.save),
        ),
      ),
    );
  }
}
