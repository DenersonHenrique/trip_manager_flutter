import 'dart:async';
import 'dart:convert';

import '../../../../commons/adapters/storage/storage_client.dart';
import '../../../../commons/helpers/errors/local_errors.dart';
import '../models/registered_user_model.dart';

abstract class IAuthLocalDatasource {
  Future<RegisteredUserModel?> get();
  Future<void> save(String key, dynamic value);
  FutureOr<void> clear();
}

class AuthLocalDatasource extends IAuthLocalDatasource {
  final IStorageClient _storageClient;

  AuthLocalDatasource(this._storageClient);

  @override
  Future<RegisteredUserModel?> get() async {
    try {
      final response = await _storageClient.read('user');

      if (response == null) {
        return null;
      }

      return RegisteredUserModel.fromMap(jsonDecode(response));
    } on Exception catch (error) {
      throw LocalDatasourceException(exception: error);
    }
  }

  @override
  Future<void> save(String key, dynamic value) async {
    try {
      await _storageClient.save(key, value);
    } on Exception catch (error) {
      throw LocalDatasourceException(exception: error);
    }
  }

  @override
  FutureOr<void> clear() => _storageClient.clear();
}
