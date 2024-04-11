import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transactions_repository.dart';
import '../datasources/transactions_local_datasource.dart';
import '../models/transaction_model.dart';

class TransactionsRepository implements ITransactionsRepository {
  final ITransactionsLocalDatasource _transactionsDatasource;

  TransactionsRepository(this._transactionsDatasource);

  @override
  Future<List<TransactionEntity>> getTransactionsList() async {
    final response = await _transactionsDatasource.get();
    return response;
  }

  @override
  Future<void> addTransaction(TransactionEntity entity) async {
    final model = TransactionModel.fromEntity(entity).toMap;
    await _transactionsDatasource.save(model);
  }

  @override
  Future<int> deleteTransaction(TransactionEntity entity) async {
    final model = TransactionModel.fromEntity(entity).toMap;
    return await _transactionsDatasource.remove(model);
  }
}
