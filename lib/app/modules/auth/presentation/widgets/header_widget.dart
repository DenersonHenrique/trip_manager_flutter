import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.5,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF3127F3),
                Color(0xFF5E51D0),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(90),
            ),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(),
              Align(
                alignment: Alignment.center,
                child: Icon(
                  size: 90,
                  Icons.person,
                  color: Colors.white,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
