abstract class RegisterDataSource {
  Future<List<String>> register(String phone);
  Future<bool> validation(String code);
}
