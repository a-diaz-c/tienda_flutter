import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  SharedPreferences _prefs;

  PreferenciasUsuario() {
    _loadCounter();
  }
  _loadCounter() async {
    _prefs = await SharedPreferences.getInstance();
  }

  get nombreUsuario {
    return _prefs.getString('nombreUsuario');
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }
}
