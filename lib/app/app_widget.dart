import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:friends_secrets/app/shared/res/themes/themes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Modular.setObservers([
      asuka.asukaHeroController,
      Modular.get<FirebaseAnalyticsObserver>(),
    ]);
    return MaterialApp.router(
      title: Modular.get<DotEnv>().env["APP_NAME"].toString(),
      theme: Themes.light(),
      darkTheme: Themes.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      builder: asuka.builder,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
