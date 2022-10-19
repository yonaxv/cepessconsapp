import 'package:cepess/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                          onPressed: () => {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MainScreen()))
                          },
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
}
