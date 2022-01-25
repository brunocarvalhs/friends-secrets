abstract class ContactsDataSource {
  Future<List<dynamic>> get({
    String? query,
    bool withThumbnails = true,
    bool photoHighResolution = true,
    bool orderByGivenName = true,
    bool iOSLocalizedLabels = true,
    bool androidLocalizedLabels = true,
  });
  Future<dynamic> add(dynamic contact);
  Future<dynamic> delete(dynamic contact);
  Future<dynamic> update(dynamic contact);
  Future<dynamic> openContactForm();
  Future<dynamic> openExisting(dynamic contact);
}
