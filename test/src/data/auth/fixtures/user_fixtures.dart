import 'package:laverdi/src/domain/user/dtos/credentials.dart';
import 'package:laverdi/src/domain/user/user.dart';

class UserFixtures {
  UserFixtures();

  static const tUserMap = {
    'id': 'KWpyI46G6lTxSbHmAT9ELvbVkFI3',
    'name': 'João Victor Terzi',
    'email': 'jermelterzi@gmail.com',
    'token': 'zGvJgzpPzUMliaw90gBXKkqGSIPWJlPG8qbyHPzCbGZkiwHPGXcfK4BbUElm27KJ',
  };

  static const tLoggedUser = LoggedUser(
    id: 'KWpyI46G6lTxSbHmAT9ELvbVkFI3',
    name: 'João Victor Terzi',
    email: 'jermelterzi@gmail.com',
    token: 'zGvJgzpPzUMliaw90gBXKkqGSIPWJlPG8qbyHPzCbGZkiwHPGXcfK4BbUElm27KJ',
  );

  static const tUser = User(
    id: '',
    name: 'João Victor Terzi',
    email: 'jermelterzi@gmail.com',
  );

  static final tCredentials = Credentials(
    email: 'jermelterzi@gmail.com',
    password: 'Abc.1234',
  );
}
