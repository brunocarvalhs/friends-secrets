import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:friends_secrets/app/modules/groups/infra/datasource/contacts_datasource.dart';

class ContactServiceDatasource implements ContactsDataSource {
  ContactServiceDatasource();

  @override
  Future<List<Contact>> getContacts({
    bool withProperties = true,
    bool withThumbnail = false,
    bool withPhoto = true,
    bool withGroups = false,
    bool withAccounts = false,
    bool sorted = true,
    bool deduplicateProperties = true,
  }) async {
    return await FlutterContacts.getContacts(
      withProperties: withProperties,
      withThumbnail: withThumbnail,
      withPhoto: withPhoto,
      withGroups: withGroups,
      withAccounts: withAccounts,
      sorted: sorted,
      deduplicateProperties: deduplicateProperties,
    );
  }
}
