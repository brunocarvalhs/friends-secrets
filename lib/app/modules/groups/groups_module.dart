import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/read/groups_read_controller.dart';
import 'package:friends_secrets/app/modules/groups/presenter/pages/read/groups_read_page.dart';
import 'package:friends_secrets/app/modules/groups/presenter/stores/register_group_store.dart';
import './domain/repositories/albums_repository.dart';
import './domain/repositories/contacts_repository.dart';
import './domain/repositories/groups_repository.dart';
import './domain/repositories/type_repository.dart';
import './domain/usecases/delete_group.dart';
import './domain/usecases/get_groups.dart';
import './domain/usecases/list_contacts.dart';
import './domain/usecases/list_types.dart';
import './domain/usecases/read_group.dart';
import './domain/usecases/register_group.dart';
import './domain/usecases/register_image.dart';
import './domain/usecases/select_image.dart';
import './external/contacts_datasource.dart';
import './external/galery_photo_datasource.dart';
import './infra/datasource/contacts_datasource.dart';
import './infra/datasource/galery_photo_datasource.dart';
import './infra/repositories/albums_repository.dart';
import './infra/repositories/contacts_repository.dart';
import './infra/repositories/groups_repository.dart';
import './infra/repositories/types_repository.dart';
import './presenter/pages/create/categories/groups_register_type_controller.dart';
import './presenter/pages/create/categories/groups_register_type_page.dart';
import './presenter/pages/create/information/groups_register_information_controller.dart';
import './presenter/pages/create/information/groups_register_information_page.dart';
import './presenter/pages/create/members/groups_register_members_controller.dart';
import './presenter/pages/create/members/groups_register_members_page.dart';
import './presenter/pages/list/groups_list_controller.dart';
import './presenter/pages/list/groups_list_page.dart';
import 'package:image_picker/image_picker.dart';

class GroupsModule extends Module {
  @override
  final List<Bind> binds = [
    // Dependencies -----------------------------------------------------------------------------
    Bind.instance<ImagePicker>(ImagePicker()),
    // Stores -----------------------------------------------------------------------------------
    Bind.lazySingleton<RegisterGroupStore>((i) => RegisterGroupStore(i.get())),
    // Datasource -------------------------------------------------------------------------------
    Bind.factory<GaleryPhotoDatasource>((i) => GaleryPhotoDatasourceImpl(i.get())),
    Bind.factory<ContactsDataSource>((i) => ContactServiceDatasource()),
    // Repositories -----------------------------------------------------------------------------
    Bind.factory<GroupsRepository>((i) => GroupsRepositoryImpl(i.get(), i.get())),
    Bind.factory<TypesRepository>((i) => TypesRepositoryImpl(i.get())),
    Bind.factory<ContactsRepository>((i) => ContactsRepositoryImpl(i.get())),
    Bind.factory<AlbumsRepository>((i) => AlbumsRepositoryImpl(i.get())),
    // Use Case ---------------------------------------------------------------------------------
    Bind.factory<ReadGroup>((i) => ReadGroupImpl(i.get())),
    Bind.factory<DeleteGroup>((i) => DeleteGroupImpl(i.get())),
    Bind.factory<SelectImage>((i) => SelectImageImpl(i.get())),
    Bind.factory<GetGroups>((i) => GetGroupsImpl(i.get())),
    Bind.factory<RegistersGroup>((i) => RegisterGroupImpl(i.get())),
    Bind.factory<ListTypes>((i) => ListTypesImpl(i.get())),
    Bind.factory<ListContacts>((i) => ListContactsImpl(i.get())),
    Bind.factory<RegisterImage>((i) => RegisterImageImpl(i.get())),
    // Controllers -------------------------------------------------------------------------------
    Bind.factory((i) => GroupsListController(i.get(), i.get())),
    Bind.factory((i) => GroupsRegisterMembersController(i.get(), i.get(), i.get())),
    Bind.factory((i) => GroupsRegisterTypeController(i.get(), i.get(), i.get())),
    Bind.factory((i) => GroupsRegisterInformationController(i.get(), i.get(), i.get())),
    Bind.factory((i) => GroupsReadController(i.get(), i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const GroupsListPage()),
    ChildRoute("/register/members", child: (_, args) => const GroupsRegisterMembersPage()),
    ChildRoute("/register/type", child: (_, args) => const GroupsRegisterTypePage()),
    ChildRoute("/register/information", child: (_, args) => const GroupsRegisterInformationPage()),
    ChildRoute("/:uuid", child: (_, args) => GroupsReadPage(groupModel: args.data))
  ];
}
