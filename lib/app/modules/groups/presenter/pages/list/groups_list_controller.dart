import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part "groups_list_controller.g.dart";

@Injectable()
class GroupsListController = _GroupsListControllerBase with _$GroupsListController;

abstract class _GroupsListControllerBase with Store {
  @observable
  bool loading = false;

  @action
  void setLoading(bool value) => loading = value;

  Future<void> request() async {
    setLoading(true);

    setLoading(false);
  }

  bool scrollController(ScrollNotification scroll) {
    if (scroll is ScrollEndNotification) request();
    return true;
  }
}
