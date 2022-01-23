import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/list_types.dart';
import 'package:friends_secrets/app/modules/groups/infra/models/type_model.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part "groups_register_type_controller.g.dart";

@Injectable()
class GroupsRegisterTypeController = _GroupsRegisterTypeControllerBase with _$GroupsRegisterTypeController;

abstract class _GroupsRegisterTypeControllerBase with Store {
  final AuthStore user;
  final ListTypes listTypes;

  _GroupsRegisterTypeControllerBase(this.user, this.listTypes) {
    request();
  }

  @observable
  ObservableList<TypeModel> _listType = ObservableList<TypeModel>.of([]);

  @computed
  bool get isType => _listType.isNotEmpty;

  @computed
  int get countType => _listType.length;

  @computed
  List<TypeModel> get allType => _listType.toList();

  @action
  void add(TypeModel value) => _listType.add(value);

  @action
  void addAll(Iterable<TypeModel> contacts) {
    _listType.clear();
    _listType.addAll(contacts);
  }

  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  Future<void> request() async {
    setLoading(true);
    var result = await listTypes();
    result.fold((failure) {}, (list) {
      addAll(list as Iterable<TypeModel>);
    });
    setLoading(false);
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

  void redirect() => Modular.to.pushNamed("/home/register/information");
}
