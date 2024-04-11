import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/transaction_entity.dart';
import '../../../../commons/extensions/build_context_extension.dart';

class TransactionListWidget extends StatelessWidget {
  final void Function(String) onRemove;
  final List<TransactionEntity>? transactions;

  const TransactionListWidget({
    super.key,
    required this.transactions,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) => transactions!.isEmpty
      ? LayoutBuilder(
          builder: (ctx, constraints) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: context.screenHeight * 0.10,
                  child: Center(
                    child: Text(
                      'Nenhuma transação cadastrada!',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                SizedBox(
                  height: context.screenHeight * 0.30,
                  width: context.screenWidth * 0.60,
                  child: Image.asset(
                    'assets/images/empty_list.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ],
            );
          },
        )
      : ListView.builder(
          itemCount: transactions?.length,
          itemBuilder: (ctx, index) {
            final transaction = transactions?[index];
            return Card(
              margin: const EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 5,
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 40,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: FittedBox(
                      child:
                          Text('R\$${transaction?.value.toStringAsFixed(2)}'),
                    ),
                  ),
                ),
                title: Text(
                  transaction!.title,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                subtitle: Text(
                  DateFormat('d MMM y').format(transaction.date),
                ),
                trailing: MediaQuery.of(context).size.width > 480
                    ? TextButton.icon(
                        onPressed: () => onRemove(transaction.id),
                        icon: const Icon(Icons.delete),
                        label: const Text('Excluir'),
                      )
                    : IconButton(
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).colorScheme.error,
                        onPressed: () => onRemove(transaction.id),
                      ),
              ),
            );
          },
        );
}
