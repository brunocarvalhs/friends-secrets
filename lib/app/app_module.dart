import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:tf_dio_cache/dio_http_cache.dart';

import './core/localization/generated/l10n.dart';
import './app_guard.dart';
import './core/domain/guards/auth_guard.dart';
import './core/domain/repositories/network_repository.dart';
import './core/external/dio_datasource.dart';
import './core/infra/datasources/network_datasource.dart';
import './core/infra/repositories/network_repository_impl.dart';
import './modules/groups/groups_module.dart';
import './modules/login/login_module.dart';
import './modules/notification/notification_module.dart';
import './modules/profile/profile_module.dart';
import './modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        SplashModule(),
        LoginModule(),
        GroupsModule(),
        ProfileModule(),
        NotificationModule(),
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
    Bind.instance<FirebaseDynamicLinks>(FirebaseDynamicLinks.instance),
    Bind.lazySingleton<FirebaseAnalyticsObserver>(
        (i) => FirebaseAnalyticsObserver(analytics: i.get())),
    Bind.instance<DioCacheManager>(DioCacheManager(
        CacheConfig(baseUrl: dotenv.env['BASE_URL'].toString()))),
    Bind.instance<Dio>(Dio(BaseOptions(
      baseUrl: dotenv.env['BASE_URL'].toString(),
      connectTimeout: 60 * 1000, // 60 seconds
      receiveTimeout: 60 * 1000, // 60 seconds
    ))),
    Bind.lazySingleton<NetworkDataSource>(
        (i) => DioDataSourceImpl(i.get(), i.get(), i.get())),
    Bind.lazySingleton<NetworkRepository>(
        (i) => NetworkRepositoryImpl(i.get())),
    Bind.instance<Connectivity>(Connectivity()),
    Bind.instance<I10n>(I10n()),
    AsyncBind<SharedPreferences>((i) => SharedPreferences.getInstance()),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute,
        module: SplashModule(), guards: [AppGuard(Modular.initialRoute)]),
    ModuleRoute("/login", module: LoginModule()),
    ModuleRoute("/home", module: GroupsModule(), guards: [AuthGuard()]),
    ModuleRoute("/profile", module: ProfileModule(), guards: [AuthGuard()]),
    ModuleRoute("/notification",
        module: NotificationModule(), guards: [AuthGuard()]),
  ];
}
