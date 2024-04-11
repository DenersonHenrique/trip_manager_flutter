import '../../../commons/helpers/presentation/mvvm/viewmodel_state.dart';
import '../domain/entities/transaction_entity.dart';

class HomeState extends ViewModelState {
  factory HomeState.initial() => const HomeState();
  final bool hasError;
  final bool isLoading;
  final List<TransactionEntity>? transactionList;

  const HomeState({
    this.hasError = false,
    this.isLoading = false,
    this.transactionList = const [],
  });

  HomeState copyWith({
    bool? hasError,
    bool? isLoading,
    List<TransactionEntity>? transactionList,
  }) {
    return HomeState(
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      transactionList: transactionList ?? this.transactionList,
    );
  }
}
