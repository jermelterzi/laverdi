import 'package:flutter_test/flutter_test.dart';
import 'package:laverdi/src/data/auth/data_sources/local_auth_data_source.dart';
import 'package:laverdi/src/data/services/secure_database.dart';
import 'package:laverdi/src/utils/error/database_exceptions.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:result_dart/result_dart.dart';

import '../../../domain/user/fixtures/user_fixtures.dart';
@GenerateNiceMocks([MockSpec<SecureDatabase>()])
import 'local_auth_data_source_test.mocks.dart';

void main() {
  late final MockSecureDatabase secureDatabaseMock;
  late final LocalAuthDataSource localAuthDataSource;

  setUpAll(() {
    secureDatabaseMock = MockSecureDatabase();
    localAuthDataSource = LocalAuthDataSourceImpl(
      secureDatabase: secureDatabaseMock,
    );
  });

  group('LocalAuthDataSource -', () {
    group('deleteUser:', () {
      test(
        'Should return a Success when the database delete the user '
        'successfully',
        () async {
          // ARRANGE
          when(
            secureDatabaseMock.remove(
              boxName: anyNamed('boxName'),
              key: anyNamed('key'),
            ),
          ).thenAnswer(
            (_) async {},
          );

          // ACT
          final deleteUserResult = await localAuthDataSource.deleteUser();

          // ASSERT
          expect(deleteUserResult, equals(const Success(unit)));
          verify(secureDatabaseMock.remove(boxName: 'user', key: 0)).called(1);
        },
      );

      test(
        'Should return a Failure when the database throws a '
        'NoEncryptedKeySavedException',
        () async {
          // ARRANGE
          when(
            secureDatabaseMock.remove(
              boxName: anyNamed('boxName'),
              key: anyNamed('key'),
            ),
          ).thenThrow(
            NoEncryptedKeySavedException(),
          );

          // ACT
          final deleteUserResult = await localAuthDataSource.deleteUser();

          // ASSERT
          expect(deleteUserResult.isError(), isTrue);
          verify(secureDatabaseMock.remove(boxName: 'user', key: 0)).called(1);
        },
      );
    });

    group('getUser:', () {
      test(
        'Should return the logged user when it exists',
        () async {
          // ARRANGE
          when(
            secureDatabaseMock.get(
              boxName: anyNamed('boxName'),
              key: anyNamed('key'),
            ),
          ).thenAnswer(
            (_) async => UserFixtures.tUserMap,
          );

          // ACT
          final deleteUserResult = await localAuthDataSource.getUser();

          // ASSERT
          expect(
            deleteUserResult,
            equals(const Success(UserFixtures.tLoggedUser)),
          );
          verify(secureDatabaseMock.get(boxName: 'user', key: 0)).called(1);
        },
      );

      test(
        'Should return a Failure when the database throws a '
        'NoEncryptedKeySavedException',
        () async {
          // ARRANGE
          when(
            secureDatabaseMock.get(
              boxName: anyNamed('boxName'),
              key: anyNamed('key'),
            ),
          ).thenThrow(
            NoEncryptedKeySavedException(),
          );

          // ACT
          final deleteUserResult = await localAuthDataSource.getUser();

          // ASSERT
          expect(deleteUserResult.isError(), isTrue);
          verify(secureDatabaseMock.get(boxName: 'user', key: 0)).called(1);
        },
      );

      test(
        'Should return a Failure when the database throws a '
        'NoItemException',
        () async {
          // ARRANGE
          when(
            secureDatabaseMock.get(
              boxName: anyNamed('boxName'),
              key: anyNamed('key'),
            ),
          ).thenThrow(
            NoItemException(),
          );

          // ACT
          final deleteUserResult = await localAuthDataSource.getUser();

          // ASSERT
          expect(deleteUserResult.isError(), isTrue);
          verify(secureDatabaseMock.get(boxName: 'user', key: 0)).called(1);
        },
      );
    });

    group('saveUser:', () {
      test(
        'Should save the user locally when method is called',
        () async {
          // ARRANGE
          when(
            secureDatabaseMock.save(
              boxName: anyNamed('boxName'),
              key: anyNamed('key'),
              value: anyNamed('value'),
            ),
          ).thenAnswer(
            (_) async {},
          );

          // ACT
          final saveUserResult =
              await localAuthDataSource.saveUser(UserFixtures.tLoggedUser);

          // ASSERT
          expect(saveUserResult, equals(const Success(unit)));
          verify(
            secureDatabaseMock.save(
              boxName: 'user',
              key: 0,
              value: UserFixtures.tUserMap,
            ),
          );
        },
      );
    });
  });
}
