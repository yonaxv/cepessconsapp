import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Column(
          children: <Widget>[
            Text(
              "Bienvenido!",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Image.asset(
              'assets/logo/logocepess.png',
              width: 180,
              height: 180,
            )
          ],
        )));
  }
}
