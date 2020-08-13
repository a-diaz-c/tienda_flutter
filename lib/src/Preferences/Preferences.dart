import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  nombreUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var usuario = prefs.getString('usuario');
    if (usuario == null) {
      return usuario = 'Iniciar Sesion';
    }
    return usuario;
  }

  guardarUsuario(String usuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('usuario', usuario);
    //_nombreUsuario();
  }

  borrarUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('usuario');
    //nombreUsuario();
  }
}
