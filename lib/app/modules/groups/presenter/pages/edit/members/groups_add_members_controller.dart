import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/repositories/contacts_repository.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/list_contacts.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/update_group.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/group_model.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
import 'package:friends_secrets/app/shared/widgets/loading_default.dart';
import 'package:mobx/mobx.dart';
import 'package:asuka/asuka.dart' as asuka;

part 'groups_add_members_controller.g.dart';

@Injectable()
class GroupsAddMembersController = _GroupsAddMembersControllerBase with _$GroupsAddMembersController;

abstract class _GroupsAddMembersControllerBase with Store {
  final ListContacts listContacts;
  final UpdateGroup _updateGroup;
  final ContactsRepository _contactsRepository;

  _GroupsAddMembersControllerBase(this.listContacts, this._updateGroup, this._contactsRepository) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Group Add Members');
  }

  @observable
  // ignore: prefer_final_fields
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
  // ignore: prefer_final_fields
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
    final result = await _contactsRepository.getContacts();
    return result.fold((l) => [], (r) => r);
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

  Future<void> update(BuildContext context) async {
    var entry = OverlayEntry(builder: (context) => const LoadingDefault());
    asuka.addOverlay(entry);
    var group = (Modular.args.data as GroupModel).copyWith(users: allContacts);
    var result = await _updateGroup(Modular.args.params["id"], group);
    entry.remove();
    result.fold((failure) {
      asuka.AsukaSnackbar.warning(failure.message.toString()).show();
    }, (r) => Modular.to.pop());
  }
}
