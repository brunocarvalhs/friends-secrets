abstract class RegisterDataSource {
  Future<bool> register(String verificationId, String code);
  Future<String?> validation(String phone);
}
