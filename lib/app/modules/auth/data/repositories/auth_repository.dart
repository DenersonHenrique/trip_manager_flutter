import '../../domain/entities/registered_user_entity.dart';
import '../../domain/entities/login_params_entity.dart';
import '../../domain/repositories/auth_respository.dart';
import '../datasources/auth_remote_datasource.dart';
import '../datasources/auth_local_datasource.dart';
import '../models/user_model.dart';

class AuthRepository implements IAuthRepository {
  final IAuthRemoteDatasource _authRemoteDatasource;
  final IAuthLocalDatasource _localDatasource;

  AuthRepository(
    this._authRemoteDatasource,
    this._localDatasource,
  );

  @override
  Future<RegisteredUserEntity> registerUser(LoginParamsEntity params) async {
    final userModel = UserModel.fromEntity(params);
    final response = await _authRemoteDatasource.signUp(userModel);
    return response;
  }

  @override
  Future<RegisteredUserEntity> authenticate(LoginParamsEntity params) async {
    final userModel = UserModel.fromEntity(params);
    final response = await _authRemoteDatasource.authenticate(userModel);
    return response;
  }

  @override
  Future<String?> getToken() async {
    final user = await _localDatasource.get();

    if (user == null) return null;
    return user.idToken;
  }

  @override
  Future<RegisteredUserEntity?> getUserCredentials() async {
    final user = await _localDatasource.get();
    return user;
  }

  @override
  Future<void> logout() async => await _localDatasource.clear();
}
