import 'dart:async';

import 'package:sqflite/sqflite.dart';

abstract class IDatabaseStorage {
  // Método abstrato para obter o nome do banco de dados
  String get databaseName;

  // Método abstrato para definir a estrutura do banco de dados
  Future<void> onCreate(Database db, int version);

  // Método abstrato para abrir o banco de dados
  Future<Database> open();

  // Método para fechar o banco de dados
  Future<void> close();

  // Método para executar uma operação SQL sem retorno de dados
  Future<void> execute(String sql, [List<dynamic>? arguments]);

  // Método para executar uma query SQL e retornar uma lista de mapas
  Future<List<Map<String, dynamic>>> query(
    String sql, [
    List<dynamic>? arguments,
  ]);

  // Método para inserir dados em uma tabela
  Future<int> insert(String table, Map<String, dynamic> values);

  // Método para atualizar dados em uma tabela
  Future<int> update(
    String table,
    Map<String, dynamic> values,
    String where,
    List<dynamic> whereArgs,
  );

  // Método para excluir dados de uma tabela
  Future<int> delete(String table, String where, List<dynamic> whereArgs);
}
