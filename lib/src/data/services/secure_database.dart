import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laverdi/src/utils/error/database_exceptions.dart';

abstract interface class SecureDatabase {
  /// @throws
  /// NoEncryptedKeySavedException
  /// NoItemException
  Future<Map<String, dynamic>> get({
    required String boxName,
    required dynamic key,
  });

  /// @throws
  /// NoEncryptedKeySavedException
  Future<void> remove({required String boxName, required dynamic key});

  Future<void> save({
    required String boxName,
    required dynamic key,
    required Map<String, dynamic> value,
  });
}

class SecureDatabaseImpl implements SecureDatabase {
  final HiveInterface _hive;
  final FlutterSecureStorage _secureStorage;

  SecureDatabaseImpl({
    required HiveInterface hive,
    required FlutterSecureStorage secureStorage,
  })  : _secureStorage = secureStorage,
        _hive = hive;

  @override
  Future<Map<String, dynamic>> get({
    required String boxName,
    required dynamic key,
  }) async {
    final encryptionKey = await _secureStorage.read(key: boxName);

    final doesEncryptionKeyNotExist = encryptionKey == null;

    if (doesEncryptionKeyNotExist) throw NoEncryptedKeySavedException();

    final encryptionKeyUint8List = base64Url.decode(encryptionKey);

    final encryptedBox = await _hive.openBox<Map<String, dynamic>>(
      boxName,
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );

    final item = encryptedBox.get(key);

    final doesItemNotExist = item == null;

    if (doesItemNotExist) throw NoItemException();

    return item;
  }

  @override
  Future<void> remove({required String boxName, required dynamic key}) async {
    final encryptionKey = await _secureStorage.read(key: boxName);

    final doesEncryptionKeyNotExist = encryptionKey == null;

    if (doesEncryptionKeyNotExist) throw NoEncryptedKeySavedException();

    final encryptionKeyUint8List = base64Url.decode(encryptionKey);

    final encryptedBox = await _hive.openBox<Map<String, dynamic>>(
      boxName,
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );

    return encryptedBox.delete(key);
  }

  @override
  Future<void> save({
    required String boxName,
    required dynamic key,
    required Map<String, dynamic> value,
  }) async {
    final encryptionKey = await _secureStorage.read(key: boxName);

    final doesEncryptionKeyNotExist = encryptionKey == null;

    if (doesEncryptionKeyNotExist) {
      final secureKey = _hive.generateSecureKey();
      final encryptedKey = base64UrlEncode(secureKey);

      await _secureStorage.write(key: boxName, value: encryptedKey);

      return _saveSecureItem(
        boxName: boxName,
        key: key,
        encryptionKey: encryptedKey,
        value: value,
      );
    }

    return _saveSecureItem(
      boxName: boxName,
      key: key,
      encryptionKey: encryptionKey,
      value: value,
    );
  }

  Future<void> _saveSecureItem({
    required String boxName,
    required dynamic key,
    required String encryptionKey,
    required Map<String, dynamic> value,
  }) async {
    final encryptionKeyUint8List = base64Url.decode(encryptionKey);

    final encryptedBox = await _hive.openBox<Map<String, dynamic>>(
      boxName,
      encryptionCipher: HiveAesCipher(encryptionKeyUint8List),
    );

    return encryptedBox.put(key, value);
  }
}
