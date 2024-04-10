import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../../../commons/utils/utils.dart';
import '../../auth/services/auth.dart';
import 'splash_state.dart';

class SplashViewModel extends ViewModel<SplashState> {
  final IAuthService _authService;

  SplashViewModel(
    this._authService,
  ) : super(SplashState.initial());

  load() async {
    await Future.delayed(const Duration(seconds: 3));
    final response = await _authService.getUserCredentials();

    if (response?.idToken != null) {
      Nav.pushReplacementNamed('/home');
    } else {
      Nav.pushReplacementNamed('/auth');
    }
  }
}
