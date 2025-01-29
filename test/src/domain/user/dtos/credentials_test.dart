import 'package:flutter_test/flutter_test.dart';

import 'fixtures/credentials_fixtures.dart';

void main() {
  group('Credentials', () {
    group('validateEmail:', () {
      test(
        'Should return true when the email is valid',
        () {
          // ACT
          final isEmailValid = CredentialsFixtures.tCredentials.validateEmail();

          // ASSERT
          expect(isEmailValid, isTrue);
        },
      );
    });

    group('validatePassword:', () {
      test(
        'Should return true when the password is valid',
        () {
          // ACT
          final isPasswordValid =
              CredentialsFixtures.tCredentials.validatePassword();

          // ASSERT
          expect(isPasswordValid, isTrue);
        },
      );
    });
  });
}
