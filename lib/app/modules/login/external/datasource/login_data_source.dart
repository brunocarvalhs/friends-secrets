import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/errors/errors.dart';
import '../../infra/models/user_model.dart';
import '../../infra/datasource/login_data_source.dart';

class LoginDataSourceImpl implements LoginDataSource {
  final GoogleSignIn googleSignIn;
  final SharedPreferences secureStorage;
  final NetworkDataSource http;
  final FirebaseMessaging firebaseMessaging;
  final FirebaseAuth firebaseAuth;
  final Connectivity connectivity;

  LoginDataSourceImpl(
    this.googleSignIn,
    this.secureStorage,
    this.http,
    this.firebaseMessaging,
    this.firebaseAuth,
    this.connectivity,
  );

  @override
  Future<UserModel> currentUser() async {
    final connect = await connectivity.checkConnectivity();
    if (connect == ConnectivityResult.none) throw ConnectError();

    var storage = secureStorage.getString("auth");
    var token = secureStorage.getString("token");

    if (storage != null && token != null) {
      http.setToken(token);
      try {
        final response = await http.get("/user");
        final user = UserModel.fromMap(response.data);
        await secureStorage.setString("auth", user.toJson());
        return user;
      } catch (e) {
        _exception(e);
        throw ServerConnectError();
      }
    }

    throw ErrorGetLoggedUser();
  }

  @override
  Future<void> logout() async {
    await secureStorage.remove("auth");
    await firebaseAuth.signOut();
    return await googleSignIn.signOut().then((value) => null);
  }

  @override
  Future<UserModel> login() async {
    final connect = await connectivity.checkConnectivity();
    if (connect == ConnectivityResult.none) throw ConnectError();

    var googleUser = await googleSignIn.signIn();
    if (googleUser == null) throw ErrorLogin();

    final fcmToken = await firebaseMessaging.getToken();

    var params = {
      "email": googleUser.email,
      "googleAuth": googleUser.id,
      "name": googleUser.displayName,
      "photoUrl": googleUser.photoUrl,
      "fcmToken": fcmToken,
    };

    try {
      final response = await http.post("/login", data: params);
      final token = response.data["token"];
      final user = UserModel.fromMap(response.data["user"]);

      http.setToken(token);
      await secureStorage.setString("auth", user.toJson());
      await secureStorage.setString("token", token);

      return user;
    } catch (e) {
      _exception(e);
      throw ServerConnectError();
    }
  }

  void _exception(exception) {
    if (Modular.get<FirebaseCrashlytics>().isCrashlyticsCollectionEnabled) {
      Modular.get<FirebaseCrashlytics>()
          .setCustomKey("Exception", exception.toString());
      Modular.get<FirebaseCrashlytics>()
          .setUserIdentifier("${Modular.get<AuthStore>().user?.id}");
    }
  }
}
