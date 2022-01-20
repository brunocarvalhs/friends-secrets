import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/app_guard.dart';
import 'package:friends_secrets/app/modules/login/login_module.dart';
import 'package:friends_secrets/app/modules/splash/splash_module.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        SplashModule(),
        LoginModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.instance<DotEnv>(dotenv),
    Bind.instance<FirebaseApp>(Firebase.app()),
    Bind.instance<FirebaseAnalytics>(FirebaseAnalytics()),
    Bind.instance<FirebaseMessaging>(FirebaseMessaging.instance),
    Bind.lazySingleton<FirebaseAnalyticsObserver>((i) => FirebaseAnalyticsObserver(analytics: i.get())),
    Bind.instance<Dio>(Dio(BaseOptions(baseUrl: dotenv.env['BASE_URL'].toString()))),
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule(), guards: [AppGuard(Modular.initialRoute)]),
    ModuleRoute("/login", module: LoginModule()),
  ];
}
