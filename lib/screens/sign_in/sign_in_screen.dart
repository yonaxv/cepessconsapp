// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:ffi';

import 'package:cepess/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

_launchWhatsapp() async {
  var url = Uri.parse(
    "https://wa.me/59177691656",
  );
  await launchUrl(url, mode: LaunchMode.externalApplication);
}

_launchWebsite() async {
  var url = Uri.parse("https://institutocepess.edu.bo/");
  await launchUrl(url, mode: LaunchMode.externalApplication);
}

launchPlatataformaVirtual() async {
  var url = Uri.parse("https://aulavirtual.institutocepess.edu.bo/");
  await launchUrl(url, mode: LaunchMode.externalApplication);
}

_launchFacebookApp() async {
  var url = Uri.parse("https://www.facebook.com/cepess");
  await launchUrl(url, mode: LaunchMode.externalApplication);
}

class _SignInScreenState extends State<SignInScreen> {
  var codController = TextEditingController();
  var nroController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              children: [
                Image.asset(
                  'assets/logo/logocepess.png',
                  width: 190,
                  height: 190,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: codController,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.numbers),
                              labelText: 'Codigo de Estudiante',
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black87)),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: nroController,
                          keyboardType: TextInputType.text,
                          decoration: const InputDecoration(
                              icon: Icon(Icons.password),
                              labelText: 'Nro de Celular',
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black87)),
                              isDense: false,
                              contentPadding: EdgeInsets.all(10)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                                  foregroundColor:
                                      Theme.of(context).colorScheme.onPrimary,
                                  backgroundColor: Colors.black87
                                  // Theme.of(context).colorScheme.primary,
                                  )
                              .copyWith(
                                  elevation: ButtonStyleButton.allOrNull(0.0)),
                          onPressed: () => {login()},
                          child: const Text('Iniciar Sesion'),
                        ),
                        const SizedBox(
                          height: 70,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.facebook,
                                size: 35,
                              ),
                              color: Colors.blue,
                              onPressed: _launchFacebookApp,
                            ),
                            SizedBox(width: 15),
                            IconButton(
                              icon: Icon(Icons.web,
                                  size: 35, color: Colors.lightBlue),
                              onPressed: _launchWebsite,
                            ),
                            SizedBox(width: 15),
                            IconButton(
                              icon: Icon(
                                Icons.local_library_outlined,
                                size: 35,
                                color: Colors.black54,
                              ),
                              onPressed: launchPlatataformaVirtual,
                            ),
                            SizedBox(width: 15),
                            IconButton(
                              icon: Icon(
                                Icons.whatsapp,
                                size: 35,
                                color: Colors.green,
                              ),
                              onPressed: _launchWhatsapp,
                            ),
                          ],
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

  Future<void> login() async {
    final url = Uri.parse("https://appcepesscons.herokuapp.com/api/auth/login");
    if (nroController.text.isNotEmpty && codController.text.isNotEmpty) {
      var response = await http.post(url,
          body: ({'codigo': codController.text, 'nro': nroController.text}));
      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 401) {
        String msgerr = data['msg'].toString();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(msgerr)));
      } else if (response.statusCode == 200) {
        print(response.body);
        String token = data['token'].toString();
        String nombre =
            data['nombre'].toString() + ' ' + data['apellidos'].toString();
        String estado = data['estado'].toString();
        _saveValue(token, nombre, estado);
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Debe llenar todos los campos")));
    }
  }
}

_saveValue(String token, String nombre, String estado) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('token', token);
  await prefs.setString('nombre', nombre);
  await prefs.setString('estado', estado);
}
