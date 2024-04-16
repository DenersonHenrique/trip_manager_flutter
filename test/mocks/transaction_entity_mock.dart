import 'package:faker/faker.dart';
import 'package:trip_manager_flutter/app/modules/home/domain/domain.dart';

class MockTransactionEntity extends TransactionEntity {
  const MockTransactionEntity({
    required super.id,
    required super.title,
    required super.value,
    required super.date,
  });

  factory MockTransactionEntity.random() {
    final faker = Faker();
    return MockTransactionEntity(
      id: faker.randomGenerator.integer(999).toString(),
      title: faker.lorem.word(),
      value: faker.randomGenerator.decimal(scale: 2),
      date: faker.date.dateTime(),
    );
  }
}
