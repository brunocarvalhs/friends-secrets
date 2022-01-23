import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/get_groups.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

part "groups_register_members_controller.g.dart";

@Injectable()
class GroupsRegisterMembersController = _GroupsRegisterMembersControllerBase with _$GroupsRegisterMembersController;

abstract class _GroupsRegisterMembersControllerBase with Store {
  final AuthStore user;
  final GetGroups getGroups;

  _GroupsRegisterMembersControllerBase(this.user, this.getGroups) {
    request();
  }

  @observable
  ObservableList<UserModel> _listContacts = ObservableList<UserModel>.of([]);

  @computed
  bool get isContacts => _listContacts.isNotEmpty;

  @computed
  int get countContacts => _listContacts.length;

  @computed
  List<UserModel> get allContacts => _listContacts.toList();

  @action
  void add(UserModel value) => _listContacts.add(value);

  @action
  void addAll(Iterable<UserModel> contacts) {
    _listContacts.clear();
    _listContacts.addAll(contacts);
  }

  Future<void> request() async {
    if (await Permission.contacts.request().isGranted) {
      List<Contact> contacts = await FlutterContacts.getContacts();
      final users = contacts.map((e) => UserModel(uuid: "uuid", name: e.displayName));
      addAll(users);
    }
  }

  @observable
  bool _buttonExtends = true;

  @computed
  bool get buttonExtends => _buttonExtends;

  @action
  void setExtendsButton(bool value) => _buttonExtends = value;

  bool notificationPredicate(ScrollNotification scroll) {
    setExtendsButton(scroll.metrics.extentAfter > scroll.metrics.extentBefore);
    return true;
  }

  void redirect() => Modular.to.pushNamed("/home/register/type");
}
