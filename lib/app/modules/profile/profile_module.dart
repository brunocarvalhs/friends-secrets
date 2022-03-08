import 'package:flutter_modular/flutter_modular.dart';
import 'package:friends_secrets/app/modules/profile/domain/repositories/likers_repository.dart';
import 'package:friends_secrets/app/modules/profile/domain/usecases/list_likers.dart';
import 'package:friends_secrets/app/modules/profile/domain/usecases/save_list_likes.dart';
import 'package:friends_secrets/app/modules/profile/infra/repositories/likers_repository.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/likers/likers_controller.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/likers/likers_page.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/profile/profile_controller.dart';
import 'package:friends_secrets/app/modules/profile/presenter/pages/profile/profile_page.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    // Dependencies -----------------------------------------------------------------------------
    // Stores -----------------------------------------------------------------------------------
    // Datasource -------------------------------------------------------------------------------
    // Repositories -----------------------------------------------------------------------------
    Bind.factory<LikersRepository>((i) => LikersRepositoryImpl(i.get(), i.get())),
    // Use Case ---------------------------------------------------------------------------------
    Bind.factory<ListLikers>((i) => ListLikersImpl(i.get())),
    Bind.factory<SaveListLikes>((i) => SaveListLikesImpl(i.get())),
    // Controllers -------------------------------------------------------------------------------
    Bind.factory((i) => ProfileController(i.get())),
    Bind.factory((i) => LikersController(i.get(), i.get(), i.get())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => const ProfilePage()),
    ChildRoute("/likers", child: (_, args) => const LikersPage()),
  ];
}
