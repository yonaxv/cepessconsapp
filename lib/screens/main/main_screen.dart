import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Bienvenido!')),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black26,
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        }),
      ),
      drawer: Sidenav(),
    );
  }
}

class Sidenav extends StatelessWidget {
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
              Text('Apaza Blanco Hoover Jonatan'),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.circle,
                    color: Colors.green,
                    size: 10,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('Activo')
                ],
              ),
              Divider(
                color: Colors.grey.shade400,
              ),
              buidMenuItem(text: 'Consulta de notas', icon: Icons.list),
              Divider(
                color: Colors.grey.shade400,
              ),
              buidMenuItem(text: 'Cerrar Sesion', icon: Icons.logout)
            ]),
          ),
        ],
      ),
    );
  }
}

Widget buidMenuItem({required String text, required IconData icon}) {
  return ListTile(
    leading: Icon(icon),
    title: Text(text),
    onTap: () {},
  );
}
