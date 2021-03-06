import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:friends_secrets/app/modules/login/domain/errors/errors.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../infra/datasource/register_data_source.dart';

class RegisterDataSourceImpl implements RegisterDataSource {
  final GoogleSignIn googleSignIn;
  final SharedPreferences secureStorage;
  final NetworkDataSource http;
  final FirebaseAuth firebaseAuth;
  final Connectivity connectivity;

  RegisterDataSourceImpl(
    this.googleSignIn,
    this.secureStorage,
    this.http,
    this.firebaseAuth,
    this.connectivity,
  );

  @override
  Future<bool> register(String verificationId, String code) async {
    final connect = await connectivity.checkConnectivity();
    if (connect == ConnectivityResult.none) throw ConnectError();

    AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);

    final result = await firebaseAuth.signInWithCredential(credential);

    var params = {
      "phone": result.user?.phoneNumber,
    };

    final response = await http.post("/phone", data: params);

    return response.statusCode == 200;
  }

  @override
  Future<String?> validation(String phone) async {
    final connect = await connectivity.checkConnectivity();
    if (connect == ConnectivityResult.none) throw ConnectError();

    final completer = Completer<String>();

    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: '+55 $phone',
      timeout: const Duration(seconds: 60),
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        completer.completeError(e);
      },
      codeSent: (String verificationId, int? resendToken) {
        completer.complete(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        completer.complete(verificationId);
      },
    );

    return completer.future;
  }
}
