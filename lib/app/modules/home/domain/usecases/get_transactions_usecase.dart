import '../entities/transaction_entity.dart';
import '../repositories/transactions_repository.dart';

abstract class IGetTransactionsUsecase {
  Future<List<TransactionEntity>> call();
}

class GetTransactionsUsecase implements IGetTransactionsUsecase {
  final ITransactionsRepository _repository;

  GetTransactionsUsecase(this._repository);

  @override
  Future<List<TransactionEntity>> call() async =>
      await _repository.getTransactionsList();
}
