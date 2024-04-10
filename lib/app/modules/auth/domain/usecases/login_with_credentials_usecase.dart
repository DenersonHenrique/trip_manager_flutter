import '../entities/registered_user_entity.dart';
import '../entities/login_params_entity.dart';
import '../repositories/auth_respository.dart';

abstract class ILoginWithCredentialsUsecase {
  Future<RegisteredUserEntity> call(LoginParamsEntity params);
}

class LoginWithCredentialsUsecase implements ILoginWithCredentialsUsecase {
  final IAuthRepository _repository;

  LoginWithCredentialsUsecase(this._repository);

  @override
  Future<RegisteredUserEntity> call(LoginParamsEntity params) {
    return _repository.authenticate(params);
  }
}
