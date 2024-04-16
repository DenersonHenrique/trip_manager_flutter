import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:trip_manager_flutter/app/modules/home/domain/domain.dart';
import 'package:trip_manager_flutter/app/modules/home/presentantion/widgets/transaction_list_widget.dart';

class MockTransactionEntity extends Mock implements TransactionEntity {}

void main() {
  setUpAll(() {
    registerFallbackValue(DateTime.now());
  });

  testWidgets('TransactionListWidget with empty transactions',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TransactionListWidget(
            transactions: const [],
            onEdit: (context, transaction) {},
            onRemove: (transaction) {},
          ),
        ),
      ),
    );

    // Verifique se o texto 'Nenhuma despesa cadastrada!' é exibido
    expect(find.text('Nenhuma despesa cadastrada!'), findsOneWidget);

    // Verifique se a imagem de lista vazia é exibida
    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is Image &&
            widget.image is AssetImage &&
            (widget.image as AssetImage).assetName ==
                'assets/images/empty_list.png',
      ),
      findsOneWidget,
    );
  });

  testWidgets('TransactionListWidget with transactions',
      (WidgetTester tester) async {
    // Crie uma lista de transações fictícia
    final transactions = [
      MockTransactionEntity(),
      MockTransactionEntity(),
    ];
    when(() => transactions[0].value)
        .thenReturn(50.0); // Valor fictício para a primeira transação
    when(() => transactions[0].title)
        .thenReturn('Despesa 1'); // Título fictício para a primeira transação
    when(() => transactions[0].date)
        .thenReturn(DateTime.now()); // Data fictícia para a primeira transação

    when(() => transactions[1].value)
        .thenReturn(100.0); // Valor fictício para a segunda transação
    when(() => transactions[1].title)
        .thenReturn('Despesa 2'); // Título fictício para a segunda transação
    when(() => transactions[1].date).thenReturn(
      DateTime.now().subtract(
        const Duration(days: 1),
      ),
    ); // Data fictícia para a segunda transação

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: TransactionListWidget(
            transactions: transactions,
            onEdit: (context, transaction) {},
            onRemove: (transaction) {},
          ),
        ),
      ),
    );

    // Verifique se os itens da lista estão sendo exibidos corretamente
    expect(find.text('Despesa 1'), findsOneWidget);
    expect(find.text('R\$50.00'), findsOneWidget);
    expect(
      find.text(DateFormat('dd/MM/y').format(DateTime.now())),
      findsOneWidget,
    ); // Data formatada para hoje
    expect(find.text('Despesa 2'), findsOneWidget);
    expect(find.text('R\$100.00'), findsOneWidget);
    expect(
      find.text(
        DateFormat('dd/MM/y')
            .format(DateTime.now().subtract(const Duration(days: 1))),
      ),
      findsOneWidget,
    ); // Data formatada para ontem
  });
}
