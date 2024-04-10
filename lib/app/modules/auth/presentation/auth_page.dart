import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import '../domain/entities/login_params_entity.dart';
import 'auth_viewmodel.dart';
import 'widgets/auth_form_widget.dart';
import 'widgets/header_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends ViewState<AuthPage, AuthViewModel> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    );
  }

  onSubmit(LoginParamsEntity params, String urlSegment) {
    if (urlSegment == 'signUp') {
      viewModel.registerUser(params);
    } else {
      viewModel.authenticate(params);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderWidget(),
            AuthFormWidget(
              onSubmit: onSubmit,
              isLoading: viewModel.state.isLoading,
            ),
          ],
        ),
      ),
    );
  }
}
