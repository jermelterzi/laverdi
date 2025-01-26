import 'package:laverdi/src/data/services/secure_database.dart';
import 'package:laverdi/src/domain/user/user.dart';
import 'package:laverdi/src/utils/error/database_exceptions.dart';
import 'package:result_dart/result_dart.dart';

abstract interface class LocalAuthDataSource {
  AsyncResult<Unit> deleteUser();
  AsyncResult<LoggedUser> getUser();
  AsyncResult<Unit> saveUser(LoggedUser user);
}

class LocalAuthDataSourceImpl implements LocalAuthDataSource {
  final SecureDatabase _secureDatabase;

  LocalAuthDataSourceImpl({required SecureDatabase secureDatabase})
      : _secureDatabase = secureDatabase;

  @override
  AsyncResult<Unit> deleteUser() async {
    try {
      await _secureDatabase.remove(boxName: 'user', key: 0);
    } on NoEncryptedKeySavedException catch (e) {
      return Failure(e);
    }

    return const Success(unit);
  }

  @override
  AsyncResult<LoggedUser> getUser() async {
    late final Map<String, dynamic> userMap;

    try {
      userMap = await _secureDatabase.get(boxName: 'user', key: 0);
    } on NoEncryptedKeySavedException catch (e) {
      return Failure(e);
    } on NoItemException catch (e) {
      return Failure(e);
    }

    return Success(LoggedUser.fromMap(userMap));
  }

  @override
  AsyncResult<Unit> saveUser(LoggedUser user) async {
    await _secureDatabase.save(boxName: 'user', key: 0, value: user.toMap());

    return const Success(unit);
  }
}
