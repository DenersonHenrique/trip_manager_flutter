import '../entities/registered_user_entity.dart';
import '../entities/login_params_entity.dart';

abstract class IAuthRepository {
  Future<RegisteredUserEntity> registerUser(LoginParamsEntity params);
  Future<RegisteredUserEntity> authenticate(LoginParamsEntity params);
  Future<RegisteredUserEntity?> getUserCredentials();
  Future<void> logout();
  Future<String?> getToken();
}
