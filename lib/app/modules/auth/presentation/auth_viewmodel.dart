import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../../../commons/utils/utils.dart';
import '../domain/entities/login_params_entity.dart';
import '../domain/usecases/login_with_credentials_usecase.dart';
import '../domain/usecases/user_register_usecase.dart';
import 'auth_state.dart';

class AuthViewModel extends ViewModel<AuthState> {
  final IUserRegisterUsecase _registerUsecase;
  final ILoginWithCredentialsUsecase _loginWithCredentialsUsecase;

  AuthViewModel(
    this._registerUsecase,
    this._loginWithCredentialsUsecase,
  ) : super(AuthState.initial());

  void registerUser(LoginParamsEntity params) async {
    emit(state.copyWith(isLoading: true));

    try {
      final result = await _registerUsecase(params);
      emit(state.copyWith(isLoading: false));
    } catch (error) {
      emit(state.copyWith(hasError: true));
    }
  }

  void authenticate(LoginParamsEntity params) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _loginWithCredentialsUsecase(params);
      Nav.pushReplacementNamed('/home');
      emit(state.copyWith(isLoading: false));
    } catch (error) {
      emit(state.copyWith(hasError: true));
    }
  }
}
