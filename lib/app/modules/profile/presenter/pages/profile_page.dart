import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/shared/utils/assets_utils.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/profile_controller.dart';

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
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * 0.4,
            height: MediaQuery.of(context).size.height * 0.4,
            padding: const EdgeInsets.only(bottom: 20),
            child: Image.asset(logo, key: const Key("logo")),
          ),
        ),
      ),
    );
  }
}
