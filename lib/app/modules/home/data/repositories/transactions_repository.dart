import '../../domain/entities/transaction_entity.dart';
import '../../domain/repositories/transactions_repository.dart';
import '../datasources/transaction_local_datasource.dart';

class TransactionsRepository implements ITransactionsRepository {
  final ITransactionsLocalDatasource _transactionsDatasource;

  TransactionsRepository(this._transactionsDatasource);

  @override
  Future<List<TransactionEntity>> getTransactionsList() async {
    final response = await _transactionsDatasource.get();
    return response;
  }
}
