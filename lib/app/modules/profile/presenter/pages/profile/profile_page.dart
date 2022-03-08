import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/profile/profile_controller.dart';
import 'package:friends_secrets/app/shared/widgets/app_bar_default.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends ModularState<ProfilePage, ProfileController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (_, b) => [
            AppBarDefault(
                actions: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.edit),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () => controller.signOut(),
                      icon: const Icon(Icons.exit_to_app),
                    ),
                  ),
                ],
                expandedHeight: 400,
                title:
                    "${Modular.get<AuthStore>().getName?.split(" ").first}\n${Modular.get<AuthStore>().getName?.split(" ").last}",
                childTop: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("${Modular.get<AuthStore>().getPhoto}"),
                      radius: 60,
                    ),
                  ),
                )),
          ],
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  child: Observer(builder: (context) {
                    return Wrap(
                      spacing: 10,
                      children: Modular.get<AuthStore>()
                              .user
                              ?.likers
                              ?.map(
                                (item) => Chip(
                                  label: Text('${item.name}'),
                                  padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                                ),
                              )
                              .toList() ??
                          [],
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
