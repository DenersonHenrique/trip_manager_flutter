import 'package:equatable/equatable.dart';

class TransactionEntity extends Equatable {
  final String? id;
  final String? title;
  final double? value;
  final DateTime? date;

  const TransactionEntity({
    required this.id,
    required this.title,
    required this.value,
    required this.date,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        value,
        date,
      ];
}
