abstract class RegisterDataSource {
  Future<Map<String, dynamic>> register(String phone);
  Future<bool> validation(String code);
}
