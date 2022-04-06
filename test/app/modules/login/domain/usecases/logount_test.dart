import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:friends_secrets/app/modules/login/domain/errors/errors.dart';
import 'package:friends_secrets/app/modules/login/domain/repositories/login_repository.dart';
import 'package:friends_secrets/app/modules/login/domain/usecases/logount.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'logount_test.mocks.dart';

@GenerateMocks([
  LoginRepository
], customMocks: [
  MockSpec<LoginRepository>(
    as: #LoginRepositoryMock,
    returnNullOnMissingStub: true,
  ),
  MockSpec<GoogleSignIn>(
    as: #GoogleSignInMock,
    returnNullOnMissingStub: true,
  )
])
void main() {
  final repository = MockLoginRepository();
  final usecase = LogoutImpl(repository);
  test('feat(login) - should verify if exist User Logged', () async {
    when(repository.logout()).thenAnswer((_) async => const Right(unit));
    var result = (await usecase()).fold((l) => null, (r) => r);
    expect(result, unit);
  });
  test('feat(login) - should return null if user not logged', () async {
    when(repository.logout())
        .thenAnswer((_) async => Left(ErrorLogout(message: '')));

    var result = (await usecase()).fold(id, id);
    expect(result, isA<ErrorLogout>());
  });
}
