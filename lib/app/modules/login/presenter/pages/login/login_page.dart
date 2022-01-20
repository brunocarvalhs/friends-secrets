import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/login/login_controller.dart';
import 'package:friends_secrets/app/modules/login/presenter/widgets/social_login_button/social_login_button_widget.dart';
import 'package:friends_secrets/app/shared/utils/assets_utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(bottom: 20),
              child: Image.asset(
                loginBackground,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Organize seus\namigos secretos\nem um lugar",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 16),
                Text(
                  "Crie grupos para realizar seu amigo\nsecreto com seus amigos",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headline3,
                ),
                const SizedBox(height: 42),
                Center(
                  child: SocialLoginButtonWidget.google(
                    label: "Entrar com Google",
                    onTap: () => controller.enterGoogle(),
                    styleLabel: Theme.of(context).textTheme.button,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
