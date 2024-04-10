import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../../../commons/utils/utils.dart';
import '../../auth/services/auth.dart';
import 'home_state.dart';

class HomeViewModel extends ViewModel<HomeState> {
  final IAuthService _authService;

  HomeViewModel(
    this._authService,
  ) : super(HomeState.initial());

  logout() async {
    await _authService.logout();
    Nav.pushReplacementNamed('/auth');
  }
}
