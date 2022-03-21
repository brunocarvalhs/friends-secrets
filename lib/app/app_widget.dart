import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:friends_secrets/app/core/localization/generated/l10n.dart';
import 'package:friends_secrets/app/shared/res/themes/themes.dart';
import 'package:uni_links/uni_links.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    initObservers();
    return MaterialApp.router(
      title: Modular.get<DotEnv>().env["APP_NAME"].toString(),
      theme: Themes.light(),
      darkTheme: Themes.dark(),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      builder: asuka.builder,
      routeInformationParser: Modular.routeInformationParser,
      routerDelegate: Modular.routerDelegate,
      localizationsDelegates: const [
        I10n.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en", "US"),
        Locale("pt", "BR"),
      ],
    );
  }

  Future<void> initDeeplink() async {
    final result = await getInitialLink();
    if (result != null) Modular.setInitialRoute(result);
  }

  void initObservers() {
    Modular.setObservers([
      asuka.asukaHeroController,
      Modular.get<FirebaseAnalyticsObserver>(),
    ]);
  }
}
