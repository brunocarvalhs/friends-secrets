import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/app_guard.dart';
import 'package:friends_secrets/app/core/domain/guards/auth_guard.dart';
import 'package:friends_secrets/app/core/domain/repositories/network_repository.dart';
import 'package:friends_secrets/app/core/external/dio_datasource.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/core/infra/repositories/network_repository_impl.dart';
import 'package:friends_secrets/app/modules/groups/groups_module.dart';
import 'package:friends_secrets/app/modules/login/login_module.dart';
import 'package:friends_secrets/app/modules/notification/notification_module.dart';
import 'package:friends_secrets/app/modules/profile/profile_module.dart';
import 'package:friends_secrets/app/modules/splash/splash_module.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        SplashModule(),
        LoginModule(),
        GroupsModule(),
      ];

  @override
  final List<Bind> binds = [
    Bind.instance<DotEnv>(dotenv),
    Bind.instance<FirebaseApp>(Firebase.app()),
    Bind.instance<FirebaseAnalytics>(FirebaseAnalytics.instance),
    Bind.instance<FirebaseMessaging>(FirebaseMessaging.instance),
    Bind.instance<FirebasePerformance>(FirebasePerformance.instance),
    Bind.instance<FirebaseCrashlytics>(FirebaseCrashlytics.instance),
    Bind.instance<FirebaseAuth>(FirebaseAuth.instance),
    Bind.lazySingleton<FirebaseAnalyticsObserver>((i) => FirebaseAnalyticsObserver(analytics: i.get())),
    Bind.instance<Dio>(Dio(BaseOptions(
      baseUrl: dotenv.env['BASE_URL'].toString(),
      connectTimeout: 60 * 1000, // 60 seconds
      receiveTimeout: 60 * 1000, // 60 seconds
    ))),
    Bind.lazySingleton<NetworkDataSource>((i) => DioDataSourceImpl(i.get(), i.get())),
    Bind.lazySingleton<NetworkRepository>((i) => NetworkRepositoryImpl(i.get())),
    Bind.instance<Connectivity>(Connectivity()),
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule(), guards: [AppGuard(Modular.initialRoute)]),
    ModuleRoute("/login", module: LoginModule()),
    ModuleRoute("/home", module: GroupsModule(), guards: [AuthGuard()]),
    ModuleRoute("/profile", module: ProfileModule(), guards: [AuthGuard()]),
    ModuleRoute("/notification", module: NotificationModule(), guards: [AuthGuard()]),
  ];
}
