import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:friends_secrets/app/core/shared/res/themes/themes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Modular.get<DotEnv>().env["APP_NAME"].toString(),
      theme: Themes.light(),
      darkTheme: Themes.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      navigatorObservers: [
        asuka.asukaHeroController,
        Modular.get<FirebaseAnalyticsObserver>(),
      ],
      builder: asuka.builder,
    ).modular();
  }
}
