import '../entities/transaction_entity.dart';

abstract class ITransactionsRepository {
  Future<List<TransactionEntity>> getTransactionsList();
}
