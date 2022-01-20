import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:friends_secrets/app/modules/login/domain/repositories/login_repository.dart';
import 'package:friends_secrets/app/modules/login/infra/datasource/login_data_source.dart';

import 'domain/usecases/get_logged_user.dart';
import 'domain/usecases/login_with_google.dart';
import 'domain/usecases/logount.dart';
import 'external/datasource/login_data_source.dart';
import 'infra/repositories/login_repository.dart';
import 'presenter/stores/auth_store.dart';
import 'presenter/pages/login/login_controller.dart';
import 'presenter/pages/login/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    // Global ------------------------------------------------------------------------------------------
    Bind.instance<GoogleSignIn>(GoogleSignIn(), export: true),
    // Stores ------------------------------------------------------------------------------------------
    Bind.lazySingleton<AuthStore>((i) => AuthStore(i.get(), i.get()), export: true),
    // Use cases ---------------------------------------------------------------------------------------
    Bind.lazySingleton<Logout>((i) => LogoutImpl(i.get()), export: true),
    Bind.lazySingleton<LoginWithGoogle>((i) => LoginWithGoogleImpl(i.get())),
    Bind.lazySingleton<GetLoggedUser>((i) => GetLoggedUserImpl(i.get()), export: true),
    // Repositories ------------------------------------------------------------------------------------
    Bind.lazySingleton<LoginRepository>((i) => LoginRepositoryImpl(i.get()), export: true),
    // Datasource --------------------------------------------------------------------------------------
    Bind.lazySingleton<LoginDataSource>((i) => LoginDataSourceImpl(i.get(), i.get(), i.get()), export: true),
    // Controller --------------------------------------------------------------------------------------
    Bind.lazySingleton((i) => LoginController(i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
  ];
}
