import 'dart:math';

import 'package:flutter/material.dart';

import '../../../commons/extensions/build_context_extension.dart';
import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../domain/entities/transaction_entity.dart';
import 'home_state.dart';
import 'home_viewmodel.dart';
import 'widgets/transaction_form.dart';
import 'widgets/transaction_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeViewModel> {
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

    viewModel.addTransaction(newTransaction);
    Navigator.of(context).pop();
  }

  _deleteTransaction(TransactionEntity entity) {
    viewModel.deleteTransaction(entity);
  }

  logout() {
    viewModel.logout();
  }

  @override
  void initState() {
    super.initState();
    viewModel.featchTransactionList();
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
              child: ViewModelBuilder<HomeViewModel, HomeState>(
                viewModel: viewModel,
                builder: (context, snapshot) {
                  return SizedBox(
                    height: context.screenHeight * 0.89,
                    child: TransactionListWidget(
                      transactions: viewModel.state.transactionList,
                      onRemove: _deleteTransaction,
                    ),
                  );
                },
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
}
