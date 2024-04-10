import 'package:flutter/material.dart';

import '../../../commons/helpers/presentation/mvvm/mvvm.dart';
import 'splash_viewmodel.dart';

class SplashPage extends StatefulWidget {
  final String title;

  const SplashPage({
    super.key,
    this.title = 'SplashPage',
  });

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends ViewState<SplashPage, SplashViewModel> {
  @override
  void initState() {
    super.initState();
    viewModel.load();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3127F3),
              Color(0xFF5E51D0),
              Color(0xFF948DD3),
              Color(0xFF5E4EF1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Padding(
                padding: EdgeInsets.only(
                  top: screenHeight * 0.50,
                ),
                child: const Text(
                  'SplashPage',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
