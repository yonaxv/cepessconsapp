import 'package:cepess/screens/consulta_notas/cons_notas.dart';
import 'package:cepess/screens/main/main_screen.dart';
import 'package:cepess/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String? _nombre = "Hola";
  String? _estado = "Hola";
  Color? _StatusColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/logo/logocepess.png',
                  width: 110,
                  height: 110,
                ),
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 20,
              ),
              Text('$_nombre'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: _StatusColor,
                    size: 10,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('$_estado')
                ],
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              buildMenuItem(
                  text: 'Menu Principal',
                  icon: Icons.home,
                  onClicked: () => selectedItem(context, 0)),
              buildMenuItem(
                  text: 'Consulta de notas',
                  icon: Icons.list,
                  onClicked: () => selectedItem(context, 1)),
              Divider(
                color: Colors.grey.shade400,
              ),
              buildMenuItem(
                  text: 'Cerrar Sesion',
                  icon: Icons.logout,
                  onClicked: () => selectedItem(context, 99))
            ]),
          ),
        ],
      ),
    );
  }
}

Widget buildMenuItem(
    {required String text, required IconData icon, VoidCallback? onClicked}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(text),
    onTap: onClicked,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()));
      break;
    case 1:
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => ConsNotas()));
      break;
    case 99:
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => SignInScreen()));
      break;
  }
}
