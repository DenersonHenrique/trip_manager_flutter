import 'dart:convert';

import '../../../../commons/commons.dart';
import '../../../../commons/helpers/errors/erros.dart';
import '../models/registered_user_model.dart';
import '../models/user_model.dart';

abstract class IAuthRemoteDatasource {
  Future<RegisteredUserModel> signUp(UserModel model);
  Future<RegisteredUserModel> authenticate(UserModel model);
}

class AuthRemoteDatasource extends IAuthRemoteDatasource {
  final IHttpClient _client;
  final IStorageClient storageClient;

  AuthRemoteDatasource(
    this._client,
    this.storageClient,
  );

  @override
  Future<RegisteredUserModel> signUp(UserModel model) async {
    try {
      final response = await _client.post(
        ConstsApi.signUpApiUrl,
        data: json.encode({
          'email': model.email,
          'password': model.password,
          'returnSecureToken': true,
        }),
      );

      final result = RegisteredUserModel.fromMap(
        json.decode(response.data),
      );

      return result;
    } on Exception catch (error) {
      throw DatasourceException(exception: error);
    }
  }

  @override
  Future<RegisteredUserModel> authenticate(UserModel model) async {
    try {
      final response = await _client.post(
        ConstsApi.authenticateApiUrl,
        data: json.encode({
          'email': model.email,
          'password': model.password,
          'returnSecureToken': true,
        }),
      );

      final result = RegisteredUserModel.fromMap(
        json.decode(response.data),
      );

      await storageClient.save('user', json.encode(result));

      return result;
    } on Exception catch (error) {
      throw DatasourceException(exception: error);
    }
  }
}
