import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friends_secrets/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:friends_secrets/app/modules/login/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/login/infra/datasource/login_data_source.dart';
import 'package:friends_secrets/app/modules/login/infra/models/user_model.dart';
import 'package:friends_secrets/app/modules/login/infra/repositories/login_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'login_repository_test.mocks.dart';

@GenerateMocks([
  LoginDataSource,
], customMocks: [
  MockSpec<LoginDataSource>(
    as: #LoginDataSourceMock,
    returnNullOnMissingStub: true,
  )
])
void main() {
  final faker = Faker();
  final datasource = MockLoginDataSource();
  final userReturn = UserModel(
    id: "",
    name: faker.person.name(),
    email: faker.internet.email(),
    photoUrl: faker.image.image(),
  );
  final repository = LoginRepositoryImpl(datasource);

  group("feat(login) - loggedUser", () {
    test('should get Current User Logged', () async {
      when(datasource.currentUser()).thenAnswer((_) async => userReturn);
      var result = await repository.loggedUser();
      expect(result, isA<Right<dynamic, LoggedUserInfo>>());
    });
    test('should Throw when user not logged', () async {
      when(datasource.currentUser()).thenThrow(ErrorGetLoggedUser(message: ''));
      var result = await repository.loggedUser();
      expect(result.leftMap((l) => l is ErrorGetLoggedUser), const Left(true));
    });
  });
  group("feat(login) - logout", () {
    test('should get logout', () async {
      when(datasource.logout()).thenAnswer((_) async {});
      var result = await repository.logout();
      expect(result, isA<Right<dynamic, Unit>>());
    });
    test('should Throw when user try logout', () async {
      when(datasource.logout()).thenThrow(ErrorGetLoggedUser(message: ''));
      var result = await repository.logout();
      expect(result.leftMap((l) => l is ErrorLogout), const Left(true));
    });
  });
}
