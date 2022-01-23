import 'package:friends_secrets/app/core/infra/datasources/network_datasource.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../infra/datasource/register_data_source.dart';

class RegisterDataSourceImpl implements RegisterDataSource {
  final GoogleSignIn googleSignIn;
  final SharedPreferences secureStorage;
  final NetworkDataSource http;

  RegisterDataSourceImpl(this.googleSignIn, this.secureStorage, this.http);

  @override
  Future<List<String>> register(String phone) async {
    var params = {
      "phone": phone,
    };

    final response = await http.post("/phone", data: params);

    return [""];
  }

  @override
  Future<bool> validation(String code) async {
    final response = await http.get("/phone/$code");
    return response.data["status"];
  }
}
