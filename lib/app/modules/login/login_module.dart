import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/login/domain/repositories/register_repository.dart';
import 'package:friends_secrets/app/modules/login/domain/usecases/register_phone.dart';
import 'package:friends_secrets/app/modules/login/domain/usecases/validation_phone.dart';
import 'package:friends_secrets/app/modules/login/external/datasource/register_data_source.dart';
import 'package:friends_secrets/app/modules/login/infra/datasource/register_data_source.dart';
import 'package:friends_secrets/app/modules/login/infra/repositories/register_repository.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/number_register/number_register_controller.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/number_register/number_register_page.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/number_validation/number_validation_page.dart';
import 'package:friends_secrets/app/modules/login/presenter/pages/number_validation/number_validation_controller.dart';
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
    Bind.lazySingleton<AuthStore>((i) => AuthStore(i.get(), i.get()),
        export: true),
    // Use cases ---------------------------------------------------------------------------------------
    Bind.factory<Logout>((i) => LogoutImpl(i.get()), export: true),
    Bind.factory<LoginWithGoogle>((i) => LoginWithGoogleImpl(i.get())),
    Bind.factory<GetLoggedUser>((i) => GetLoggedUserImpl(i.get()),
        export: true),
    Bind.factory<RegisterPhone>((i) => RegisterPhoneImpl(i.get())),
    Bind.factory<ValidationPhone>((i) => ValidationPhoneImpl(i.get())),
    // Repositories ------------------------------------------------------------------------------------
    Bind.factory<LoginRepository>((i) => LoginRepositoryImpl(i.get()),
        export: true),
    Bind.factory<RegisterRepository>((i) => RegisterRepositoryImpl(i.get()),
        export: true),
    // Datasource --------------------------------------------------------------------------------------
    Bind.factory<LoginDataSource>(
        (i) => LoginDataSourceImpl(
            i.get(), i.get(), i.get(), i.get(), i.get(), i.get()),
        export: true),
    Bind.factory<RegisterDataSource>(
        (i) =>
            RegisterDataSourceImpl(i.get(), i.get(), i.get(), i.get(), i.get()),
        export: true),
    // Controller --------------------------------------------------------------------------------------
    Bind.factory((i) => LoginController(i.get(), i.get())),
    Bind.factory((i) => NumberRegisterController(i.get(), i.get())),
    Bind.factory((i) => NumberValidationController(i.get(), i.get()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const LoginPage()),
    ChildRoute("/phone", child: (_, args) => const NumberRegisterPage()),
    ChildRoute("/phone/:phone",
        child: (_, args) => NumberValidationPage(verificadId: args.data)),
  ];
}
