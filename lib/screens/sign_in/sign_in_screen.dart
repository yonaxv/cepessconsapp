import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 120),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo/logocepess.png',
                  width: 190,
                  height: 190,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              icon: Icon(Icons.numbers),
                              labelText: 'Codigo de Estudiante',
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black87)),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              icon: Icon(Icons.password),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black87)),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextButton(
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.blue),
                          ),
                          onPressed: () {},
                          child: Text('TextButton'),
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
