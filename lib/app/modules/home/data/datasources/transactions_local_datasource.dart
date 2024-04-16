import '../../../../commons/adapters/storage_database/database_client.dart';
import '../../../../commons/helpers/errors/local_errors.dart';
import '../models/transaction_model.dart';

abstract class ITransactionsLocalDatasource {
  Future<List<TransactionModel>> get();
  Future<void> edit(Map<String, dynamic> model);
  Future<void> save(Map<String, dynamic> model);
  Future<int> remove(Map<String, dynamic> model);
}

class TransactionsLocalDatasource extends ITransactionsLocalDatasource {
  final IDatabaseStorage databaseStorage;

  TransactionsLocalDatasource(this.databaseStorage);

  @override
  Future<List<TransactionModel>> get() async {
    try {
      final response = await databaseStorage.query('transactions_trip_table');

      return (response as List)
          .map((element) => TransactionModel.fromMap(element))
          .toList();
    } on Exception catch (error) {
      throw LocalDatasourceException(exception: error);
    }
  }

  @override
  Future<void> save(Map<String, dynamic> model) async {
    try {
      await databaseStorage.insert('transactions_trip_table', model);
    } on Exception catch (error) {
      throw LocalDatasourceException(exception: error);
    }
  }

  @override
  Future<int> remove(Map<String, dynamic> model) async {
    try {
      const where = 'id = ?';
      final response = await databaseStorage.delete(
        'transactions_trip_table',
        where,
        [model['id']],
      );
      return response;
    } on Exception catch (error) {
      throw LocalDatasourceException(exception: error);
    }
  }

  @override
  Future<void> edit(Map<String, dynamic> model) async {
    try {
      const where = 'id = ?';
      await databaseStorage.update(
        'transactions_trip_table',
        model,
        where,
        [model['id']],
      );
    } on Exception catch (error) {
      throw LocalDatasourceException(exception: error);
    }
  }
}
