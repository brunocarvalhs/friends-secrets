import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/groups/domain/usecases/show_user_drawn_group.dart';
import 'package:friends_secrets/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:mobx/mobx.dart';

part "drawn_controller.g.dart";

@Injectable()
class DrawnController = _DrawnControllerBase with _$DrawnController;

abstract class _DrawnControllerBase with Store {
  final ShowUserDrawnGroup showUserDrawnGroup;

  _DrawnControllerBase(this.showUserDrawnGroup) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Profile');
  }

  @observable
  LoggedUserInfo? user;

  @action
  void setUser(LoggedUserInfo? value) => user = value;

  Future<void> request(BuildContext context) async {
    final result = await showUserDrawnGroup(Modular.args.params["id"]);
    return result.fold((l) {}, (user) {
      setUser(user);
    });
  }
}
