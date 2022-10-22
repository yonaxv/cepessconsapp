// To parse this JSON data, do
//
//     final resultNotas = resultNotasFromJson(jsonString);

import 'dart:convert';

ResultNotas resultNotasFromJson(String str) =>
    ResultNotas.fromJson(json.decode(str));

String resultNotasToJson(ResultNotas data) => json.encode(data.toJson());

class ResultNotas {
  ResultNotas({
    required this.status,
    required this.response,
  });

  String status;
  List<Response> response;

  factory ResultNotas.fromJson(Map<String, dynamic> json) => ResultNotas(
        status: json["status"],
        response: List<Response>.from(
            json["response"].map((x) => Response.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": List<dynamic>.from(response.map((x) => x.toJson())),
      };
}

class Response {
  Response({
    required this.codnota,
    required this.materia,
    required this.act01,
    required this.act02,
    required this.act03,
    required this.act04,
    required this.nota,
    required this.turno,
    required this.fechaIni,
    required this.fechaFin,
    required this.aula,
  });

  String codnota;
  String materia;
  int act01;
  int act02;
  int act03;
  int act04;
  int nota;
  String turno;
  DateTime fechaIni;
  DateTime fechaFin;
  String aula;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        codnota: json["codnota"],
        materia: json["materia"],
        act01: json["act_01"],
        act02: json["act_02"],
        act03: json["act_03"],
        act04: json["act_04"],
        nota: json["nota"],
        turno: json["turno"],
        fechaIni: DateTime.parse(json["fecha_ini"]),
        fechaFin: DateTime.parse(json["fecha_fin"]),
        aula: json["aula"],
      );

  Map<String, dynamic> toJson() => {
        "codnota": codnota,
        "materia": materia,
        "act_01": act01,
        "act_02": act02,
        "act_03": act03,
        "act_04": act04,
        "nota": nota,
        "turno": turno,
        "fecha_ini": fechaIni.toIso8601String(),
        "fecha_fin": fechaFin.toIso8601String(),
        "aula": aula,
      };
}
