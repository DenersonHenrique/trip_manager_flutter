import '../entities/registered_user_entity.dart';
import '../entities/login_params_entity.dart';
import '../repositories/auth_respository.dart';

abstract class IUserRegisterUsecase {
  Future<RegisteredUserEntity> call(LoginParamsEntity params);
}

class UserRegisterUsecase implements IUserRegisterUsecase {
  final IAuthRepository _repository;

  UserRegisterUsecase(this._repository);

  @override
  Future<RegisteredUserEntity> call(LoginParamsEntity params) {
    return _repository.registerUser(params);
  }
}
