import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../domain/repositories/auth_respository.dart';
import 'auth_state.dart';

class AuthNotifier extends ViewModel<AuthState> {
  final IAuthRepository _authRepository;

  AuthNotifier(this._authRepository) : super(AuthState.unauthenticated());

  Future<void> checkAndUpdateAuthStatus() async {
    final isAuthenticated = await _authRepository.getUserCredentials() != null;

    if (!isAuthenticated) {
      emit(AuthState.unauthenticated());
      return;
    }

    emit(AuthState.authenticated());
  }

  @override
  void initViewModel() {
    super.initViewModel();
    checkAndUpdateAuthStatus();
  }
}
