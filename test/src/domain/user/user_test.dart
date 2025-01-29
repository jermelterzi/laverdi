import 'package:flutter_test/flutter_test.dart';
import 'package:laverdi/src/domain/user/user.dart';

import 'fixtures/user_fixtures.dart';

void main() {
  group('User -', () {
    test(
      'Should return true when the comparated users are equal',
      () {
        // ARRANGE
        const equalUser = User(
          id: '',
          name: 'João Victor Terzi',
          email: 'jermelterzi@gmail.com',
        );

        // ACT
        final isEqual = equalUser == UserFixtures.tUser;

        // ASSERT
        expect(isEqual, isTrue);
      },
    );
  });

  group('LoggedUser -', () {
    test(
      'Should return a map with the correct informations when the method toMap '
      'is called',
      () {
        // ACT
        final loggedUserMap = UserFixtures.tLoggedUser.toMap();

        // ASSERT
        expect(loggedUserMap, equals(UserFixtures.tUserMap));
      },
    );

    test(
      'Should return a LoggedUser when the method fromMap is called',
      () {
        // ACT
        final loggedUser = LoggedUser.fromMap(UserFixtures.tUserMap);

        // ASSERT
        expect(loggedUser, equals(UserFixtures.tLoggedUser));
      },
    );

    test(
      'Should return true when the comparated logged users are equal',
      () {
        // ARRANGE
        const equalUser = LoggedUser(
          id: 'KWpyI46G6lTxSbHmAT9ELvbVkFI3',
          name: 'João Victor Terzi',
          email: 'jermelterzi@gmail.com',
          token:
              'zGvJgzpPzUMliaw90gBXKkqGSIPWJlPG8qbyHPzCbGZkiwHPGXcfK4BbUElm27KJ',
        );

        // ACT
        final isEqual = equalUser == UserFixtures.tLoggedUser;

        // ASSERT
        expect(isEqual, isTrue);
      },
    );
  });

  group('NotLoggedUser -', () {
    test(
      'Should return a NotLoggedUser when the constructor is called',
      () {
        // ACT
        const notLoggedUser = NotLoggedUser();

        // ASSERT
        expect(notLoggedUser, isA<NotLoggedUser>());
      },
    );
  });
}
