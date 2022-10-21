import 'package:shared_preferences/shared_preferences.dart';

class validations {
  _saveValue(String token, String nombre, String estado) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
    await prefs.setString('nombre', nombre);
    await prefs.setString('estado', estado);
  }

  Future<String?> _returnValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = await prefs.getString("token");
    return token;
  }
}
