abstract class ContactsDataSource {
  Future<List<dynamic>> get();
  Future<dynamic> add(dynamic contact);
  Future<dynamic> delete(dynamic contact);
  Future<dynamic> update(dynamic contact);
  Future<dynamic> openContactForm();
  Future<dynamic> openExisting(dynamic contact);
}
