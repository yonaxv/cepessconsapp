import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cepess/menu.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ConsNotas extends StatelessWidget {
  const ConsNotas({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consulta de Notas'),
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
      drawer: Menu(),
      body: ListaNotas(context),
    );
  }

  getToken() async {
    final storage = FlutterSecureStorage();
    final token =
        await storage.read(key: 'token').then((value) => value.toString());
    return token;
  }

  Widget ListaNotas(BuildContext context) {
    final token = getToken().toString();

    final titles = [
      "Instalación de Aplicaciones".toLowerCase(),
      "SABADO MAÑANA".toLowerCase(),
      " Cargado de Software".toLowerCase()
    ];
    final subtitles = ["Aula 305", "Aula 306", "Aula 307"];
    final notas = ['73', '80', '77'];
    /* final result = [
      {
        "codnota": "20221510CDA-100",
        "materia": "Instalación de Aplicaciones",
        "act_01": 10,
        "act_02": 10,
        "act_03": 20,
        "act_04": 33,
        "nota": 73,
        "turno": "SABADO MAÑANA",
        "fecha_ini": "2022-09-17T00:00:00.000Z",
        "fecha_fin": "2022-10-08T00:00:00.000Z",
        "aula": "305"
      },
      {
        "codnota": "20221510CSO-100",
        "materia": " Cargado de Software",
        "act_01": 10,
        "act_02": 20,
        "act_03": 10,
        "act_04": 40,
        "nota": 80,
        "turno": "SABADO MAÑANA",
        "fecha_ini": "2022-08-20T00:00:00.000Z",
        "fecha_fin": "2022-09-10T00:00:00.000Z",
        "aula": "305"
      },
      {
        "codnota": "20221510ELE-100",
        "materia": "Electronica Básica Digital",
        "act_01": 10,
        "act_02": 15,
        "act_03": 17,
        "act_04": 35,
        "nota": 77,
        "turno": "SABADO MAÑANA",
        "fecha_ini": "2022-06-25T00:00:00.000Z",
        "fecha_fin": "2022-07-16T00:00:00.000Z",
        "aula": "305"
      }
    ];*/
    //falta arreglar metodo
    final result = getDatas(token.toString());
    final icons = [Icons.ac_unit, Icons.access_alarm, Icons.access_time];
    return ListView.builder(
        itemCount: result.length,
        itemBuilder: (context, index) {
          return Card(
              child: ListTile(
                  onTap: () {},
                  title:
                      Text(result[index]['materia'].toString().toLowerCase()),
                  subtitle: Text('Aula ' +
                      token.toString() +
                      result[index]['aula'].toString().toLowerCase()),
                  trailing:
                      Text(result[index]['nota'].toString().toLowerCase())));
        });
  }

  getDatas(String token) async {
    final url =
        Uri.parse("https://appcepesscons.herokuapp.com/api/notas_cons/cons");
    if (token.isNotEmpty) {
      var response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );
      var responsedata = json.decode(response.body);
      List<Materia> materias = [];
      for (var singleM in responsedata) {
        Materia materia = Materia(
            codnota: responsedata["codnota"],
            nota: responsedata["nota"],
            materia: responsedata["materia"],
            turno: responsedata["turno"]);

        //Adding user to the list.
        materias.add(materia);
      }
      return materias;
    }
  }
}

class Materia {
  final String codnota;
  final String nota;
  final String materia;
  final String turno;

  Materia({
    required this.codnota,
    required this.nota,
    required this.materia,
    required this.turno,
  });
}
