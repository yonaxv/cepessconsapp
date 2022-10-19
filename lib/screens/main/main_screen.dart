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
      title: Row(
        children: [
          Icon(Icons.read_more_sharp),
          SizedBox(
            width: 100,
          ),
          Text('Bienvenido!')
        ],
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black12,
    ));
  }
}
