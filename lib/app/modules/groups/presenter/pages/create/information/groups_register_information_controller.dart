import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/get_groups.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:mobx/mobx.dart';

part "groups_register_information_controller.g.dart";

@Injectable()
class GroupsRegisterInformationController = _GroupsRegisterInformationControllerBase
    with _$GroupsRegisterInformationController;

abstract class _GroupsRegisterInformationControllerBase with Store {
  final AuthStore user;
  final GetGroups getGroups;

  _GroupsRegisterInformationControllerBase(this.user, this.getGroups);

  Future<void> register() async {
    Modular.to.pushNamed("/home");
  }
}
