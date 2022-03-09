import 'package:edge_alerts/edge_alerts.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/presenter/stores/auth_store.dart';
import 'package:friends_secrets/app/modules/profile/domain/entities/logged_likers_info.dart';
import 'package:friends_secrets/app/modules/profile/domain/usecases/list_likers.dart';
import 'package:friends_secrets/app/modules/profile/domain/usecases/save_list_likes.dart';
import 'package:mobx/mobx.dart';

part "likers_controller.g.dart";

@Injectable()
class LikersController = _LikersControllerBase with _$LikersController;

abstract class _LikersControllerBase with Store {
  final AuthStore authStore;
  final ListLikers listLikers;
  final SaveListLikes saveListLikes;

  _LikersControllerBase(this.authStore, this.listLikers, this.saveListLikes) {
    analyticsDefines();
  }

  Future<void> analyticsDefines() async {
    await Modular.get<FirebaseAnalytics>().setCurrentScreen(screenName: 'Likers');
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

  // Likes -------------------------------------------------------------------------

  @observable
  ObservableList<LoggedLikersInfo> _likers =
      ObservableList<LoggedLikersInfo>.of(Modular.get<AuthStore>().user?.likers?.toList() ?? []);

  @action
  void selecLike(LoggedLikersInfo value) => _likers.add(value);

  @action
  void removeLike(LoggedLikersInfo value) => _likers.remove(value);

  bool isSelectedLike(LoggedLikersInfo item) {
    return _likers.contains(item);
  }

  // Item --------------------------------------------------------------------------

  @observable
  ObservableList<LoggedLikersInfo> _item = ObservableList<LoggedLikersInfo>.of([]);

  @computed
  bool get isLikers => _item.isNotEmpty;

  @computed
  int get countLikers => _item.length;

  @computed
  List<LoggedLikersInfo> get allItems => _item.toList();

  @action
  void addAll(Iterable<LoggedLikersInfo> likers) {
    _item.clear();
    _item.addAll(likers);
  }

  Future<void> request(BuildContext context) async {
    final result = await listLikers();
    result.fold((l) {}, (list) {
      addAll(list as Iterable<LoggedLikersInfo>);
    });
  }

  Future<void> save(BuildContext context) async {
    final result = await saveListLikes(_likers.toList());
    result.fold((failure) {
      edgeAlert(
        context,
        title: failure.title.toString(),
        description: failure.message.toString(),
        backgroundColor: failure.color,
        duration: const Duration(seconds: 10).inSeconds,
      );
    }, (save) {
      edgeAlert(
        context,
        title: "Sucesso",
        description: "Gostos salvos com sucesso.",
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 5).inSeconds,
      );
      Modular.to.pushNamed("/home");
    });
  }
}
