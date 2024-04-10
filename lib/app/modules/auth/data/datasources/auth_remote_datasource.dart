import 'dart:convert';

import '../../../../commons/adapters/http/http_client.dart';
import '../../../../commons/adapters/storage/storage_client.dart';
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
    const apiRegister =
        'https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAbk2ISnNl7h0MsfuCsVPHg59Kf-joLLGE';

    try {
      final response = await _client.post(
        apiRegister,
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
    const apiAutheticate =
        'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAbk2ISnNl7h0MsfuCsVPHg59Kf-joLLGE';

    try {
      final response = await _client.post(
        apiAutheticate,
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
