import '../../../../commons/adapters/storage_database/database_client.dart';
import '../../../../commons/helpers/errors/local_errors.dart';
import '../models/transaction_model.dart';

abstract class ITransactionsLocalDatasource {
  Future<List<TransactionModel>> get();
}

class TransactionsLocalDatasource extends ITransactionsLocalDatasource {
  final IDatabaseStorage databaseStorage;

  TransactionsLocalDatasource(this.databaseStorage);

  @override
  Future<List<TransactionModel>> get() async {
    try {
      final response = await databaseStorage.query('transactions');

      print(response);

      return (response as List)
          .map((e) => TransactionModel.fromMap(e))
          .toList();
    } on Exception catch (error) {
      throw LocalDatasourceException(exception: error);
    }
  }
}
