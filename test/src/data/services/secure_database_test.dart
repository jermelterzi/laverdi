import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:laverdi/src/data/services/secure_database.dart';
import 'package:laverdi/src/utils/error/database_exceptions.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'fixtures/secure_database_fixtures.dart';
@GenerateNiceMocks(
  [
    MockSpec<HiveInterface>(),
    MockSpec<FlutterSecureStorage>(),
    MockSpec<Box<Map<String, dynamic>>>(),
  ],
)
import 'secure_database_test.mocks.dart';

void main() {
  late final MockBox boxMock;
  late final MockHiveInterface hiveMock;
  late final MockFlutterSecureStorage flutterSecureStorageMock;
  late final SecureDatabase secureDatabase;

  setUpAll(() {
    boxMock = MockBox();
    hiveMock = MockHiveInterface();
    flutterSecureStorageMock = MockFlutterSecureStorage();
    secureDatabase = SecureDatabaseImpl(
      hive: hiveMock,
      secureStorage: flutterSecureStorageMock,
    );
  });

  group('SecureDatabase -', () {
    group('get:', () {
      test(
        'When the encryption key does not exist must throw a NoEncryptedKeySavedException',
        () async {
          // ARRANGE
          when(
            flutterSecureStorageMock.read(key: anyNamed('key')),
          ).thenAnswer(
            (_) async => null,
          );

          // ACT
          final call = secureDatabase.get;

          // ASSERT
          await expectLater(
            call(boxName: 'test', key: 0),
            throwsA(const TypeMatcher<NoEncryptedKeySavedException>()),
          );
          verify(flutterSecureStorageMock.read(key: 'test')).called(1);
          verifyNever(hiveMock.openBox<Map<String, dynamic>>('test'));
          verifyNever(boxMock.get(0));
        },
      );

      test(
        'A NoItemException should be thrown when there is no saved value '
        'associated with the key passed as a parameter',
        () async {
          // ARRANGE
          when(
            flutterSecureStorageMock.read(key: anyNamed('key')),
          ).thenAnswer(
            (_) async => SecureDatabaseFixtures.tEncryptedKey,
          );

          when(
            hiveMock.openBox<Map<String, dynamic>>(
              any,
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          ).thenAnswer(
            (_) async => boxMock,
          );

          when(boxMock.get(any)).thenReturn(null);

          // ACT
          final call = secureDatabase.get;

          // ASSERT
          await expectLater(
            call(boxName: 'test', key: 0),
            throwsA(const TypeMatcher<NoItemException>()),
          );
          verify(flutterSecureStorageMock.read(key: 'test')).called(1);
          verify(
            hiveMock.openBox<Map<String, dynamic>>(
              'test',
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          ).called(1);
          verify(boxMock.get(0)).called(1);
        },
      );

      test(
        'Should return the saved map when it exists',
        () async {
          // ARRANGE
          when(
            flutterSecureStorageMock.read(key: anyNamed('key')),
          ).thenAnswer(
            (_) async => SecureDatabaseFixtures.tEncryptedKey,
          );

          when(
            hiveMock.openBox<Map<String, dynamic>>(
              any,
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          ).thenAnswer(
            (_) async => boxMock,
          );

          when(boxMock.get(any)).thenReturn(SecureDatabaseFixtures.tTestItem);

          // ACT
          final item = await secureDatabase.get(boxName: 'test', key: 0);

          // ASSERT
          expect(item, equals(SecureDatabaseFixtures.tTestItem));
          verify(flutterSecureStorageMock.read(key: 'test')).called(1);
          verify(
            hiveMock.openBox<Map<String, dynamic>>(
              'test',
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          ).called(1);
          verify(boxMock.get(0)).called(1);
        },
      );
    });

    group('remove:', () {
      test(
        'Should throw a NoEncryptedKeySavedException when the encrypted key it '
        'is not saved',
        () async {
          // ARRANGE
          when(
            flutterSecureStorageMock.read(key: anyNamed('key')),
          ).thenAnswer(
            (_) async => null,
          );

          // ACT
          final call = secureDatabase.remove;

          // ASSERT
          await expectLater(
            call(boxName: 'test', key: 0),
            throwsA(const TypeMatcher<NoEncryptedKeySavedException>()),
          );
          verify(flutterSecureStorageMock.read(key: 'test')).called(1);
          verifyNever(
            hiveMock.openBox<Map<String, dynamic>>(
              'test',
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          );
          verifyNever(boxMock.delete(0));
        },
      );

      test(
        'Should remove the item when it is exists',
        () async {
          // ARRANGE
          when(
            flutterSecureStorageMock.read(key: anyNamed('key')),
          ).thenAnswer(
            (_) async => SecureDatabaseFixtures.tEncryptedKey,
          );

          when(
            hiveMock.openBox<Map<String, dynamic>>(
              any,
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          ).thenAnswer(
            (_) async => boxMock,
          );

          when(boxMock.delete(any)).thenAnswer((_) async {});

          // ACT
          await secureDatabase.remove(boxName: 'test', key: 0);

          // ASSERT
          verify(flutterSecureStorageMock.read(key: 'test')).called(1);
          verify(
            hiveMock.openBox<Map<String, dynamic>>(
              'test',
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          ).called(1);
          verify(boxMock.delete(0)).called(1);
        },
      );
    });

    group('save:', () {
      test(
        'Should create a secure key and save the item when the encryption key '
        'does not exist',
        () async {
          // ARRANGE
          when(
            flutterSecureStorageMock.read(key: anyNamed('key')),
          ).thenAnswer(
            (_) async => null,
          );

          when(
            hiveMock.generateSecureKey(),
          ).thenReturn(
            SecureDatabaseFixtures.tSecureKey,
          );

          when(
            flutterSecureStorageMock.write(
              key: anyNamed('key'),
              value: anyNamed('value'),
            ),
          ).thenAnswer(
            (_) async {},
          );

          when(
            hiveMock.openBox<Map<String, dynamic>>(
              any,
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          ).thenAnswer(
            (_) async => boxMock,
          );

          when(boxMock.put(any, any)).thenAnswer((_) async {});

          // ACT
          await secureDatabase.save(
            boxName: 'test',
            key: 0,
            value: SecureDatabaseFixtures.tTestItem,
          );

          // ASSERT
          verify(flutterSecureStorageMock.read(key: 'test')).called(1);
          verify(hiveMock.generateSecureKey()).called(1);
          verify(
            flutterSecureStorageMock.write(
              key: 'test',
              value: SecureDatabaseFixtures.tEncryptedKey,
            ),
          ).called(1);
          verify(
            hiveMock.openBox<Map<String, dynamic>>(
              'test',
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          ).called(1);
          verify(boxMock.put(0, SecureDatabaseFixtures.tTestItem)).called(1);
        },
      );

      test(
        'Should save the item when the encryption key exists',
        () async {
          // ARRANGE
          when(
            flutterSecureStorageMock.read(key: anyNamed('key')),
          ).thenAnswer(
            (_) async => SecureDatabaseFixtures.tEncryptedKey,
          );

          when(
            hiveMock.openBox<Map<String, dynamic>>(
              any,
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          ).thenAnswer(
            (_) async => boxMock,
          );

          when(boxMock.put(any, any)).thenAnswer((_) async {});

          // ACT
          await secureDatabase.save(
            boxName: 'test',
            key: 0,
            value: SecureDatabaseFixtures.tTestItem,
          );

          // ASSERT
          verify(flutterSecureStorageMock.read(key: 'test')).called(1);
          verifyNever(hiveMock.generateSecureKey());
          verifyNever(
            flutterSecureStorageMock.write(
              key: 'test',
              value: SecureDatabaseFixtures.tEncryptedKey,
            ),
          );
          verify(
            hiveMock.openBox<Map<String, dynamic>>(
              'test',
              encryptionCipher: anyNamed('encryptionCipher'),
            ),
          ).called(1);
          verify(boxMock.put(0, SecureDatabaseFixtures.tTestItem)).called(1);
        },
      );
    });
  });
}
