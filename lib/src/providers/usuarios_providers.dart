import 'dart:convert';

import 'package:http/http.dart' as http;

class UsuariosProviders {
  final String _url = 'http://maines-rest.ddns.net:8080/mainesBack/recursos';

  Future<bool> login(dynamic datos) async {
    final url = '$_url/usuarios/login';

    final resp = await http.post(url, body: datos['datos']);
    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }
}
