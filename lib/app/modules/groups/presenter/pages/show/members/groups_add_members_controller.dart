import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/list_contacts.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';

part 'groups_add_members_controller.g.dart';

@Injectable()
class GroupsAddMembersController = _GroupsAddMembersControllerBase with _$GroupsAddMembersController;

abstract class _GroupsAddMembersControllerBase with Store {
  final AuthStore user;
  final ListContacts listContacts;

  _GroupsAddMembersControllerBase(this.user, this.listContacts) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Group Add Members');
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

  // users ========================================================================

  @observable
  ObservableList<UserModel> _members =
      ObservableList<UserModel>.of((Modular.args.data as GroupModel).users?.toList() ?? []);

  @action
  void addMember(UserModel value) => _members.add(value);

  @action
  void removeMember(UserModel value) => _members.remove(value);

  bool isSelectedContact(UserModel user) {
    return _members.contains(user);
  }

  Future<void> request(BuildContext context) async {
    final contacts = await _requestListContact();
    final result = await listContacts(contacts);
    result.fold((l) {}, (users) {
      addAll(users as List<UserModel>);
    });
  }

  Future<List<String>> _requestListContact() async {
    if (await Permission.contacts.request().isGranted) {
      List<Contact> contacts = await FlutterContacts.getContacts(withPhoto: true, withProperties: true);

      final list = contacts
          .map((e) => e.phones.map((e) => e.number.replaceAll(RegExp(r"/(?<!^)\+|[^\d+]+"), "")).toList())
          .toList();

      List<String> phones = [];

      for (var contact in list) {
        for (var number in contact) {
          phones.add(number);
        }
      }

      return phones;
    } else {
      return [];
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

  Future<void> save() async {}
}
