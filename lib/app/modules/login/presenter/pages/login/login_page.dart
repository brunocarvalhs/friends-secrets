import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/shared/utils/assets_utils.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/login/login_controller.dart';
import 'package:friends_secrets/app/modules/login/presenter/widgets/social_login_button/social_login_button_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends ModularState<LoginPage, LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.46,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    loginBackground,
                    fit: BoxFit.cover,
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
                    const SizedBox(height: 30),
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
        ),
      ),
    );
  }
}
