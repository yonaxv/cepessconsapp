import 'package:flutter/material.dart';
import 'package:cepess/menu.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:cepess/models/respnotas_models.dart';

Future<ResultNotas> getNotas() async {
  final storage = FlutterSecureStorage();
  final token =
      await storage.read(key: 'token').then((value) => value.toString());
  final resp = await http.get(
      Uri.parse("https://appcepesscons.herokuapp.com/api/notas_cons/cons"),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      });
  return resultNotasFromJson(resp.body);
}

class ConsNotas extends StatefulWidget {
  const ConsNotas({Key? key}) : super(key: key);

  @override
  State<ConsNotas> createState() => _ConsNotasState();
}

class _ConsNotasState extends State<ConsNotas> {
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
      body: FutureBuilder(
        future: getNotas(),
        builder: (BuildContext context, AsyncSnapshot<ResultNotas> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return _ListaNotas(snapshot.data?.response);
          }
        },
      ),
    );
  }
}

class _ListaNotas extends StatelessWidget {
  final List<Response>? response;
  _ListaNotas(this.response);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: response?.length,
        itemBuilder: ((context, index) {
          final materia = response?[index];
          return ListTile(
              title: Text('${materia?.materia}'),
              subtitle:
                  Text('Aula   ${materia?.aula}   Turno: ${materia?.turno}'),
              trailing: Text('${materia?.nota}'));
        }));
  }
}
