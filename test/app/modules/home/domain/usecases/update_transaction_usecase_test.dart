import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_manager_flutter/app/modules/home/domain/domain.dart';

import '../../../../../mocks/transaction_entity_mock.dart';

class MockTransactionsRepository extends Mock
    implements ITransactionsRepository {}

void main() {
  late UpdateTransactionsUsecase usecase;
  late MockTransactionsRepository mockRepository;

  setUp(() {
    mockRepository = MockTransactionsRepository();
    usecase = UpdateTransactionsUsecase(mockRepository);
  });

  test('Should be update transaction', () async {
    final entity = MockTransactionEntity.random();

    when(() => mockRepository.updateTransaction(entity)).thenAnswer(
      (_) async {},
    );

    await usecase(entity);

    verify(() => mockRepository.updateTransaction(entity)).called(1);
  });
}
