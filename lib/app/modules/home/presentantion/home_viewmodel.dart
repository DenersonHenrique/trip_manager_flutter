import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../../../commons/utils/utils.dart';
import '../../auth/services/auth.dart';
import '../domain/usecases/get_transactions_usecase.dart';
import 'home_state.dart';

class HomeViewModel extends ViewModel<HomeState> {
  final IAuthService _authService;
  final IGetTransactionsUsecase _usecase;

  HomeViewModel(this._authService, this._usecase) : super(HomeState.initial());

  void featchTransactionList() async {
    emit(state.copyWith(isLoading: true));

    try {
      await Future.delayed(const Duration(seconds: 5));

      final result = await _usecase();
      emit(state.copyWith(transactionList: result));
      emit(state.copyWith(isLoading: false));
    } catch (error) {
      emit(state.copyWith(hasError: true));
    }
  }

  logout() async {
    await _authService.logout();
    Nav.pushReplacementNamed('/auth');
  }
}
