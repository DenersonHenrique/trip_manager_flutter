import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../../../commons/utils/utils.dart';
import '../../auth/services/auth.dart';
import '../domain/entities/transaction_entity.dart';
import '../domain/usecases/add_transaction_usecase.dart';
import '../domain/usecases/delete_transaction_usecase.dart';
import '../domain/usecases/get_transactions_usecase.dart';
import 'home_state.dart';

class HomeViewModel extends ViewModel<HomeState> {
  final IAuthService _authService;
  final IGetTransactionsUsecase _getTransactionsUsecase;
  final IAddTransactionsUsecase _addTransactionsUsecase;
  final IDeleteTransactionsUsecase _deleteTransactionsUsecase;

  HomeViewModel(
    this._authService,
    this._getTransactionsUsecase,
    this._addTransactionsUsecase,
    this._deleteTransactionsUsecase,
  ) : super(HomeState.initial());

  void featchTransactionList() async {
    emit(state.copyWith(isLoading: true));

    try {
      final result = await _getTransactionsUsecase();
      emit(state.copyWith(transactionList: result));
      emit(state.copyWith(isLoading: false));
    } catch (error) {
      emit(state.copyWith(hasError: true));
    }
  }

  void addTransaction(TransactionEntity entity) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _addTransactionsUsecase(entity);
      featchTransactionList();
    } catch (e) {
      emit(state.copyWith(hasError: true));
    }
    emit(state.copyWith(isLoading: false));
  }

  void deleteTransaction(TransactionEntity entity) async {
    emit(state.copyWith(isLoading: true));

    try {
      await _deleteTransactionsUsecase(entity);
      featchTransactionList();
    } catch (e) {
      emit(state.copyWith(hasError: true));
    }
    emit(state.copyWith(isLoading: false));
  }

  logout() async {
    await _authService.logout();
    Nav.pushReplacementNamed('/auth');
  }
}
