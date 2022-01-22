import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/get_groups.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part "groups_register_controller.g.dart";

@Injectable()
class GroupsRegisterController = _GroupsRegisterControllerBase with _$GroupsRegisterController;

abstract class _GroupsRegisterControllerBase with Store {
  final AuthStore user;
  final GetGroups getGroups;

  _GroupsRegisterControllerBase(this.user, this.getGroups);
}
