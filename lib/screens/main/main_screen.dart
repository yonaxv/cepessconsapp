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
            height: 400,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    'Instituto Tecnico Cepess',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  )),
              Divider(
                color: Colors.grey.shade400,
              ),
              Icon(
                Icons.person_pin_outlined,
                size: 80,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Apaza Blanco Hoover Jonatan',
              ),
              const SizedBox(
                height: 10,
              ),
              Text('Activo'),
              Divider(
                color: Colors.grey.shade400,
              ),
              ListTile(
                title: Text('Consulta de Notas'),
                leading: Icon(Icons.task_outlined),
              ),
              ListTile(
                title: Text('Cerrar Sesion'),
                leading: Icon(Icons.logout),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
