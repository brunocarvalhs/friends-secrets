import 'package:flutter/foundation.dart' show kDebugMode;
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/app_module.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:friends_secrets/app/app_widget.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: ".env");
    await Firebase.initializeApp();
    if (kDebugMode) {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
    } else {
      await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
      FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    }
    runApp(ModularApp(module: AppModule(), child: const AppWidget()));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}
