import '../entities/transaction_entity.dart';

abstract class ITransactionsRepository {
  Future<List<TransactionEntity>> getTransactionsList();
  Future<void> addTransaction(TransactionEntity entity);
  Future<int> deleteTransaction(TransactionEntity entity);
  Future<void> updateTransaction(TransactionEntity entity);
}
