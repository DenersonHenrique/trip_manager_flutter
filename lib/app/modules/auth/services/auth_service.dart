import '../domain/entities/registered_user_entity.dart';
import '../domain/repositories/auth_respository.dart';

abstract class IAuthService {
  Future<void> logout();
  Future<String?> getToken();
  Future<RegisteredUserEntity?> getUserCredentials();
}

class AuthService implements IAuthService {
  final IAuthRepository _authRepository;

  AuthService(this._authRepository);

  @override
  Future<RegisteredUserEntity?> getUserCredentials() async {
    return await _authRepository.getUserCredentials();
  }

  @override
  Future<void> logout() async => await _authRepository.logout();

  @override
  Future<String?> getToken() async => await _authRepository.getToken();
}
