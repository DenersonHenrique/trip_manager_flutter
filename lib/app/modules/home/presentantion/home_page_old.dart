import 'package:flutter/material.dart';

import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import 'home_viewmodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeViewModel> {
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
      body: const Center(
        child: Text('HomePage'),
      ),
    );
  }
}
