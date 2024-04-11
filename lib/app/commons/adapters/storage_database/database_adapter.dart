import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'database_client.dart';

class DatabaseStorageAdapter extends IDatabaseStorage {
  Database? _database;

  // Método para verificar se o banco de dados está aberto
  bool get isOpen => _database != null;

  @override
  String get databaseName => 'transactions_trip_database.db';

  @override
  Future<void> onCreate(Database db, int version) async {
    db.execute(createTransactionTableQuery);
  }

  @override
  Future<Database> open() async {
    if (!isOpen) {
      final databasesPath = await getDatabasesPath();
      final path = join(
        databasesPath,
        databaseName,
      );
      _database = await openDatabase(
        path,
        version: 1,
        onCreate: onCreate,
      );
    }
    return _database!;
  }

  @override
  Future<void> execute(String sql, [List<dynamic>? arguments]) async {
    final db = await open();
    await db.execute(sql, arguments);
  }

  @override
  Future<List<Map<String, dynamic>>> query(
    String sql, [
    List<dynamic>? arguments,
  ]) async {
    final db = await open();
    final List<Map<String, dynamic>> result = [];

    // Execute a consulta e obtenha o resultado
    final resultSet = await db.query(sql);

    // Adicione cada linha do resultado ao resultado final
    for (final row in resultSet) {
      result.add(Map<String, dynamic>.from(row));
    }

    return result;
  }

  @override
  Future<int> insert(String table, Map<String, dynamic> values) async {
    final db = await open();
    return db.insert(table, values);
  }

  @override
  Future<void> close() async {
    final db = _database;
    if (db != null && db.isOpen) {
      await db.close();
      _database = null;
    }
  }

  @override
  Future<int> update(
    String table,
    Map<String, dynamic> values,
    String where,
    List<dynamic> whereArgs,
  ) async {
    final db = await open();
    return db.update(table, values, where: where, whereArgs: whereArgs);
  }

  @override
  Future<int> delete(
    String table,
    String where,
    List<dynamic> whereArgs,
  ) async {
    final db = await open();
    return db.delete(table, where: where, whereArgs: whereArgs);
  }

  final createTransactionTableQuery = '''CREATE TABLE transactions_trip_table (
    id TEXT PRIMARY KEY,
    title TEXT,
    value REAL,
    date TEXT
  )''';
}
