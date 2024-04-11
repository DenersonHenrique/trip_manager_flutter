import 'dart:convert';

import '../../domain/entities/transaction_entity.dart';

class TransactionModel extends TransactionEntity {
  const TransactionModel({
    required super.id,
    required super.title,
    required super.value,
    required super.date,
  });

  factory TransactionModel.fromMap(Map<String, dynamic> map) =>
      TransactionModel(
        id: map['id'],
        title: map['title'],
        value: map['value'],
        date: DateTime.parse(map['date']),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['value'] = value;
    data['date'] = date;
    return data;
  }

  factory TransactionModel.fromEntity(TransactionEntity entity) =>
      TransactionModel(
        id: entity.id,
        title: entity.title,
        value: entity.value,
        date: entity.date,
      );

  Map<String, dynamic> get toMap => {
        'id': id,
        'title': title,
        'value': value,
        'date': date.toIso8601String(),
      };

  factory TransactionModel.fromJson(String source) =>
      TransactionModel.fromMap(json.decode(source));
}
