import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:laverdi/src/data/auth/data_sources/remote_auth_data_source.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../domain/user/dtos/fixtures/credentials_fixtures.dart';
import '../fixtures/user_fixtures.dart';
@GenerateNiceMocks([
  MockSpec<FirebaseAuth>(),
  MockSpec<UserCredential>(),
  MockSpec<User>(),
])
import 'remote_auth_data_source_test.mocks.dart';

void main() {
  late final MockFirebaseAuth firebaseAuthMock;
  late final MockUserCredential userCredentialMock;
  late final MockUser userMock;
  late final RemoteAuthDataSource remoteAuthDataSource;

  setUpAll(() {
    firebaseAuthMock = MockFirebaseAuth();
    userCredentialMock = MockUserCredential();
    userMock = MockUser();
    remoteAuthDataSource = RemoteAuthDataSourceImpl(
      firebaseAuth: firebaseAuthMock,
    );
  });

  group('RemoteAuthDataSource -', () {
    group('login:', () {
      test(
        'Should return a Failure when the method signInWithEmailAndPassword of '
        'the FirebaseAuth throws a FirebaseAuthException',
        () async {
          // ARRANGE
          when(
            firebaseAuthMock.signInWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenThrow(
            FirebaseAuthException(code: '422'),
          );

          // ACT
          final loginResult = await remoteAuthDataSource.login(
            CredentialsFixtures.tCredentials,
          );

          // ASSERT
          expect(loginResult.isError(), isTrue);
          verify(
            firebaseAuthMock.signInWithEmailAndPassword(
              email: 'jermelterzi@gmail.com',
              password: 'Abc.1234',
            ),
          ).called(1);
          verifyNever(userCredentialMock.user);
        },
      );

      test(
        'Should return a Failure when user of the UserCrendential returned is '
        'null',
        () async {
          // ARRANGE
          when(
            firebaseAuthMock.signInWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenAnswer(
            (_) async => userCredentialMock,
          );

          when(userCredentialMock.user).thenReturn(null);

          // ACT
          final loginResult = await remoteAuthDataSource.login(
            CredentialsFixtures.tCredentials,
          );

          // ASSERT
          expect(loginResult.isError(), isTrue);
          verify(
            firebaseAuthMock.signInWithEmailAndPassword(
              email: 'jermelterzi@gmail.com',
              password: 'Abc.1234',
            ),
          ).called(1);
          verify(userCredentialMock.user).called(1);
        },
      );

      test(
        'Should return a Success when successfully sign in and the user is '
        'valid',
        () async {
          // ARRANGE
          when(
            firebaseAuthMock.signInWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenAnswer(
            (_) async => userCredentialMock,
          );

          when(userCredentialMock.user).thenReturn(userMock);

          // ACT
          final loginResult = await remoteAuthDataSource.login(
            CredentialsFixtures.tCredentials,
          );

          // ASSERT
          expect(loginResult.isSuccess(), isTrue);
          verify(
            firebaseAuthMock.signInWithEmailAndPassword(
              email: 'jermelterzi@gmail.com',
              password: 'Abc.1234',
            ),
          ).called(1);
          verify(userCredentialMock.user).called(1);
        },
      );
    });

    group('logout:', () {
      test(
        'Should return a Success when successfully sign out',
        () async {
          // ARRANGE
          when(firebaseAuthMock.signOut()).thenAnswer((_) async {});

          // ACT
          final logoutResult = await remoteAuthDataSource.logout();

          // ASSERT
          expect(logoutResult.isSuccess(), isTrue);
          verify(firebaseAuthMock.signOut()).called(1);
        },
      );
    });

    group('register:', () {
      test(
        'Should return a Failure when the method to create an user in the '
        'FirebaseAuuth throws a FirebaseAuthException',
        () async {
          // ARRANGE
          when(
            firebaseAuthMock.createUserWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenThrow(
            FirebaseAuthException(code: '500'),
          );

          // ACT
          final registerResult = await remoteAuthDataSource.register(
            UserFixtures.tUser,
            'Abc.1234',
          );

          // ASSERT
          expect(registerResult.isError(), isTrue);
          verify(
            firebaseAuthMock.createUserWithEmailAndPassword(
              email: 'jermelterzi@gmail.com',
              password: 'Abc.1234',
            ),
          ).called(1);
          verifyNever(userCredentialMock.user);
          verifyNever(userMock.updateDisplayName(UserFixtures.tUser.name));
        },
      );

      test(
        'Should return a Failure when the user of the UserCredential, returned '
        'after create the user in FirebaseAuth, is null',
        () async {
          // ARRANGE
          when(
            firebaseAuthMock.createUserWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenAnswer(
            (_) async => userCredentialMock,
          );

          when(userCredentialMock.user).thenReturn(null);

          // ACT
          final registerResult = await remoteAuthDataSource.register(
            UserFixtures.tUser,
            'Abc.1234',
          );

          // ASSERT
          expect(registerResult.isError(), isTrue);
          verify(
            firebaseAuthMock.createUserWithEmailAndPassword(
              email: 'jermelterzi@gmail.com',
              password: 'Abc.1234',
            ),
          ).called(1);
          verify(userCredentialMock.user).called(1);
          verifyNever(userMock.updateDisplayName(UserFixtures.tUser.name));
        },
      );

      test(
        'Should return a Success when successfully create the user in '
        'FirebaseAuth',
        () async {
          // ARRANGE
          when(
            firebaseAuthMock.createUserWithEmailAndPassword(
              email: anyNamed('email'),
              password: anyNamed('password'),
            ),
          ).thenAnswer(
            (_) async => userCredentialMock,
          );

          when(userCredentialMock.user).thenReturn(userMock);

          when(userMock.updateDisplayName(any)).thenAnswer((_) async {});

          // ACT
          final registerResult = await remoteAuthDataSource.register(
            UserFixtures.tUser,
            'Abc.1234',
          );

          // ASSERT
          expect(registerResult.isSuccess(), isTrue);
          verify(
            firebaseAuthMock.createUserWithEmailAndPassword(
              email: 'jermelterzi@gmail.com',
              password: 'Abc.1234',
            ),
          ).called(1);
          verify(userCredentialMock.user).called(3);
          verify(userMock.updateDisplayName(UserFixtures.tUser.name)).called(1);
        },
      );
    });
  });
}
