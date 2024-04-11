import 'dart:math';
import 'package:flutter/material.dart';

import 'home_viewmodel.dart';
import 'widgets/transaction_form.dart';
import 'widgets/transaction_list_widget.dart';
import '../domain/entities/transaction_entity.dart';
import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../../../commons/extensions/build_context_extension.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeViewModel> {
  _deleteTransaction(String id) {
    setState(() {
      viewModel.state.transactionList?.removeWhere(
        (element) => element.id == id,
      );
    });
  }

  _openModalForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionFormWidget(onSubmit: _addTransaction);
      },
    );
  }

  _addTransaction(String title, double value, DateTime date) {
    final newTransaction = TransactionEntity(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: date,
    );

    setState(() {
      viewModel.state.transactionList?.add(newTransaction);
    });
    Navigator.of(context).pop();
  }

  logout() {
    viewModel.logout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Despesas de viagem',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: GestureDetector(
              onTap: logout,
              child: const Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
              ),
              child: SizedBox(
                height: context.screenHeight * 0.89,
                child: TransactionListWidget(
                  transactions: viewModel.state.transactionList,
                  onRemove: _deleteTransaction,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openModalForm(context),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  // final List<TransactionEntity> _transactions = [
  //   TransactionEntity(
  //     id: '1',
  //     title: 'Title 01',
  //     value: 100.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  //   TransactionEntity(
  //     id: '2',
  //     title: 'Title 02',
  //     value: 2.0,
  //     date: DateTime.now(),
  //   ),
  // ];
}
