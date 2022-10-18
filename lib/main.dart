import 'package:cepessappv1/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cepess App',
        debugShowCheckedModeBanner: false,
        home: SignInScreen());
  }
}
