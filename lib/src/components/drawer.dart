import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  final ListView lista;
  const DrawerComponent({Key key, this.lista}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: lista);
  }
}

ListView contenidoMenu() {
  return ListView(padding: EdgeInsets.zero, children: _crearItemsMenu());
}

DrawerHeader _headerDrawer(String usuario) {
  return DrawerHeader(
    decoration: BoxDecoration(
      color: Colors.blue,
    ),
    child: Text(
      usuario,
      style: TextStyle(
        color: Colors.white,
        fontSize: 24,
      ),
    ),
  );
}

ListTile _itemDrawer(String texto, IconData icono) {
  return ListTile(
    leading: Icon(icono),
    title: Text(texto),
  );
}

List<Widget> _crearItemsMenu() {
  return [
    _headerDrawer('Iniciar Sesion'),
    _itemDrawer('Messages', Icons.message),
    _itemDrawer('Profile', Icons.account_circle),
    _itemDrawer('Settings', Icons.settings),
  ];
}
