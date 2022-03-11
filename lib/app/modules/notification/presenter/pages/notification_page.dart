import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/notification/presenter/pages/notification_controller.dart';
import 'package:friends_secrets/app/modules/notification/presenter/widgets/notification_todo.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);
  @override
  NotificationPageState createState() => NotificationPageState();
}

class NotificationPageState extends ModularState<NotificationPage, NotificationController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => [
            const AppBarDefault(
              expandedHeight: 100,
              title: "Notificação",
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
                    child: CustomScrollView(
                      slivers: <Widget>[
                        Observer(
                          builder: (_) => SliverList(
                            delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) => Column(
                                children: <Widget>[
                                  NotificationTodo(
                                    notification: controller.allNotifications.elementAt(index),
                                  ),
                                  Divider(
                                    height: 2,
                                    color: Colors.grey.shade400,
                                  )
                                ],
                              ),
                              childCount: controller.countNotifications,
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
    );
  }
}
