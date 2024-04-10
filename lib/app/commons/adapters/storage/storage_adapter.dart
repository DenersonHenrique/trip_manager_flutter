import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import 'storage_client.dart';

/// Storage adapter to store data in secure storage:
//
// Keychain is used for iOS
// AES encryption is used for Android. AES secret key is encrypted with RSA and RSA key is stored in KeyStore
class StorageAdapter extends IStorageClient<String> {
  late SharedPreferences _preferences;

  // Constructor
  StorageAdapter() {
    _initStorage();
  }

  // Initialize _preferences
  Future<void> _initStorage() async {
    _preferences = await SharedPreferences.getInstance();
  }

  @override
  FutureOr<void> clear() => _preferences.clear();

  @override
  FutureOr<void> delete(String key) => _preferences.remove(key);

  @override
  FutureOr read(String key) async {
    await _initStorage();
    return _preferences.get(key);
  }

  @override
  FutureOr<void> save(String key, String value) {
    return _preferences.setString(key, value);
  }

  @override
  FutureOr readKey() => _preferences.getKeys();
}
