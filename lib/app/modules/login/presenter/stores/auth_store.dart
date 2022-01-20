import 'package:mobx/mobx.dart';
import '../../domain/entities/logged_user_info.dart';
import '../../domain/usecases/get_logged_user.dart';
import '../../domain/usecases/logount.dart';

part 'auth_store.g.dart';

class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final GetLoggedUser getLoggedUser;
  final Logout logout;
  _AuthStoreBase(this.getLoggedUser, this.logout);

  @observable
  LoggedUserInfo? user;

  @computed
  bool get isLogged => user != null;

  @computed
  String? get getName => user?.name;

  @computed
  String? get getEmail => user?.email;

  @computed
  String? get getPhoto => user?.photoUrl;

  @action
  void setUser(LoggedUserInfo? value) => user = value;

  @action
  void setName(String name) => user?.copyWith(name: name);

  @action
  void setEmail(String email) => user?.copyWith(email: email);

  @action
  void setPhoto(String photo) => user?.copyWith(photoUrl: photo);

  Future<bool> checkLogin() async {
    var result = await getLoggedUser();
    return result.fold((l) => false, (user) {
      setUser(user);
      return true;
    });
  }

  Future<void> signOut() async {
    var result = await logout();
    result.fold((l) {}, (r) {
      setUser(null);
    });
  }
}
