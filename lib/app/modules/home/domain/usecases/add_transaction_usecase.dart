import '../entities/transaction_entity.dart';
import '../repositories/transactions_repository.dart';

abstract class IAddTransactionsUsecase {
  Future<void> call(TransactionEntity entity);
}

class AddTransactionsUsecase implements IAddTransactionsUsecase {
  final ITransactionsRepository _repository;

  AddTransactionsUsecase(this._repository);

  @override
  Future<void> call(TransactionEntity entity) async =>
      await _repository.addTransaction(entity);
}
