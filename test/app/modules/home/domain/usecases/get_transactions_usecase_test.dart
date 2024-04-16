import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_manager_flutter/app/modules/home/domain/domain.dart';

import '../../../../../mocks/transaction_entity_mock.dart';

class MockTransactionsRepository extends Mock
    implements ITransactionsRepository {}

void main() {
  late GetTransactionsUsecase usecase;
  late MockTransactionsRepository mockRepository;

  setUp(() {
    mockRepository = MockTransactionsRepository();
    usecase = GetTransactionsUsecase(mockRepository);
  });

  test('Should be get list of transactions', () async {
    // Arrange
    final List<TransactionEntity> mockTransactions = [
      MockTransactionEntity.random(),
      MockTransactionEntity.random(),
      MockTransactionEntity.random(),
    ];

    // Define o comportamento esperado do mock do repositório
    when(() => mockRepository.getTransactionsList())
        .thenAnswer((_) async => mockTransactions);

    // Act
    final result = await usecase();

    // Assert
    expect(result, mockTransactions);
    verify(() => mockRepository.getTransactionsList()).called(1);
  });
}
