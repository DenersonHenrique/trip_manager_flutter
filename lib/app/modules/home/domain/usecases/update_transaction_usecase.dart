import '../entities/transaction_entity.dart';
import '../repositories/transactions_repository.dart';

abstract class IUpdateTransactionsUsecase {
  Future<void> call(TransactionEntity entity);
}

class UpdateTransactionsUsecase implements IUpdateTransactionsUsecase {
  final ITransactionsRepository _repository;

  UpdateTransactionsUsecase(this._repository);

  @override
  Future<void> call(TransactionEntity entity) async =>
      await _repository.updateTransaction(entity);
}
