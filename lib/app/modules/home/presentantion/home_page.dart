import 'package:flutter/material.dart';

import '../../../commons/commons.dart';
import '../domain/domain.dart';
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
  _openModalForm(BuildContext context, TransactionEntity? transaction) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionFormWidget(
          onEdit: _editTransaction,
          onSubmit: _addTransaction,
          transactionEntity: transaction,
        );
      },
    );
  }

  _addTransaction(TransactionEntity transaction) {
    viewModel.addTransaction(transaction);
    Navigator.of(context).pop();
  }

  _deleteTransaction(TransactionEntity entity) {
    viewModel.deleteTransaction(entity);
  }

  _editTransaction(TransactionEntity entity) {
    viewModel.updateTransaction(entity);
    Navigator.of(context).pop();
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
      backgroundColor: const Color(0xFFE3E4E8),
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
                      onEdit: _openModalForm,
                      onRemove: _deleteTransaction,
                      transactions: viewModel.state.transactionList,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _openModalForm(context, null),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
