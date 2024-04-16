import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_manager_flutter/app/modules/home/domain/domain.dart';

import '../../../../../mocks/transaction_entity_mock.dart';

class MockTransactionsRepository extends Mock
    implements ITransactionsRepository {}

void main() {
  late DeleteTransactionsUsecase deleteTransactionsUsecase;
  late MockTransactionsRepository mockRepository;

  setUp(() {
    mockRepository = MockTransactionsRepository();
    deleteTransactionsUsecase = DeleteTransactionsUsecase(mockRepository);
  });

  test('DeleteTransactionsUsecase calls deleteTransaction from repository',
      () async {
    final transaction = MockTransactionEntity.random();

    when(() => mockRepository.deleteTransaction(transaction)).thenAnswer(
      (_) async => 1,
    );

    final result = await deleteTransactionsUsecase(transaction);

    verify(() => mockRepository.deleteTransaction(transaction)).called(1);

    expect(result, 1);
  });
}
