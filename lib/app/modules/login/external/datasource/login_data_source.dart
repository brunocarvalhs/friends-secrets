import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/errors/errors.dart';
import '../../infra/models/user_model.dart';
import '../../infra/datasource/login_data_source.dart';

class LoginDataSourceImpl implements LoginDataSource {
  final GoogleSignIn googleSignIn;
  final SharedPreferences secureStorage;
  final NetworkDataSource http;

  LoginDataSourceImpl(this.googleSignIn, this.secureStorage, this.http);

  @override
  Future<UserModel> currentUser() async {
    var storage = secureStorage.getString("auth");
    var token = secureStorage.getString("token");

    if (storage != null && token != null) {
      http.setToken(token);
      final response = await http.get("/user");
      return UserModel.fromMap(response.data);
    }

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

    var params = {
      "email": googleUser.email,
      "google_auth": googleUser.id,
      "name": googleUser.displayName,
      "photoUrl": googleUser.photoUrl
    };

    final response = await http.post("/login", data: params);

    final token = response.data["token"];
    final user = UserModel.fromMap(response.data["user"]);

    http.setToken(token);
    await secureStorage.setString("auth", user.toJson());
    await secureStorage.setString("token", token);

    return user;
  }
}
