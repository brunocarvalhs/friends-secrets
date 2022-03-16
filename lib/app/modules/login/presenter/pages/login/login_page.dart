import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/localization/generated/l10n.dart';
import 'package:friends_secrets/app/shared/utils/assets_utils.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/login/login_controller.dart';
import 'package:friends_secrets/app/modules/login/presenter/widgets/social_login_button/social_login_button_widget.dart';
import 'package:friends_secrets/app/shared/widgets/header_default.dart';

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
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    loginBackground,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              HeaderDefault(
                title: Modular.get<I10n>().login_loginPage_headerDefault_title,
                subtitle: Modular.get<I10n>().login_loginPage_headerDefault_subtitle,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: SocialLoginButtonWidget.google(
          label: Modular.get<I10n>().login_loginPage_socialLoginButton_label,
          onTap: () => controller.enterGoogle(context),
        ),
      ),
    );
  }
}
