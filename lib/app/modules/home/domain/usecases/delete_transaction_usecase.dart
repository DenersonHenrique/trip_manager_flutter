import '../entities/transaction_entity.dart';
import '../repositories/transactions_repository.dart';

abstract class IDeleteTransactionsUsecase {
  Future<int> call(TransactionEntity entity);
}

class DeleteTransactionsUsecase implements IDeleteTransactionsUsecase {
  final ITransactionsRepository _repository;

  DeleteTransactionsUsecase(this._repository);

  @override
  Future<int> call(TransactionEntity entity) async =>
      await _repository.deleteTransaction(entity);
}