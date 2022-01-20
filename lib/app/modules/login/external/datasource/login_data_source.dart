import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:friends_secrets/app/shared/utils/https_utils.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/errors/errors.dart';
import '../../infra/models/user_model.dart';
import '../../infra/datasource/login_data_source.dart';

class LoginDataSourceImpl implements LoginDataSource {
  final GoogleSignIn googleSignIn;
  final SharedPreferences secureStorage;
  final Dio dio;

  LoginDataSourceImpl(this.googleSignIn, this.secureStorage, this.dio);

  @override
  Future<UserModel> currentUser() async {
    var storage = secureStorage.get("auth");
    if (storage != null) return UserModel.fromJson(storage.toString());

    throw ErrorGetLoggedUser();
  }

  @override
  Future<void> logout() async {
    await secureStorage.remove("auth");
    return await googleSignIn.signOut().then((value) => null);
  }

  @override
  Future<UserModel> login() async {
    var googleUser = await googleSignIn.signIn();
    if (googleUser == null) throw ErrorLogin();
    final googleAuth = await googleUser.authentication;

    var params = {
      "email": googleUser.email,
      "google_auth": googleUser.id,
      "name": googleUser.displayName,
      "photoUrl": googleUser.photoUrl
    };

    Response response = await dio.post(
      HttpsUtils.login,
      options: Options(headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      }),
      data: jsonEncode(params),
    );

    // var user = UserModel(
    //   id: auth.user!.uid,
    //   name: auth.user?.displayName,
    //   email: auth.user?.email,
    //   photoUrl: auth.user?.photoURL,
    //   phone: auth.user?.phoneNumber,
    // );

    // await secureStorage.setString("auth", user.toJson());

    // await firebaseFirestore.collection("users").doc(user.id).set(user.toMap());

    return UserModel(uuid: "uuid");
  }
}
