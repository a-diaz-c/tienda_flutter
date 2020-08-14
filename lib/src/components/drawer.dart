import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tienda/src/providers/usuarios_providers.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  Map<String, String> categorias = {
    '10': 'Alimento',
    '20': 'Refrescos',
    '1010': 'Carnes',
    '30': 'Ferreteria',
    '3010': 'Tornillos',
    '3020': 'Herramientas',
    '2010': 'Vinos',
    '302010': 'Taladros',
    '302020': 'Mecanicos',
  };
  String _usuario = '';
  @override
  void initState() {
    super.initState();
    _nombreUsuario();
    _listaCategorias();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(child: contenidoMenu());
  }

  ListView contenidoMenu() {
    return ListView(padding: EdgeInsets.zero, children: _crearItemsMenu());
  }

  DrawerHeader _headerDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [..._textoUsuario(), _logoCarrito()],
      ),
    );
  }

  List<Widget> _textoUsuario() {
    if (_usuario == 'Iniciar Sesion') {
      return [
        InkWell(
          child: Text(
            _usuario,
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          onTap: () => _mostrarFormulario(context),
        )
      ];
    } else {
      return [
        Text(
          _usuario,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
        InkWell(
          child: Text(
            'Cerrar Sesion',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),
          onTap: () {
            _borrarUsuario();
            setState(() {});
          },
        )
      ];
    }
  }

  ExpansionTile _itemCategoria(String categoria, List<String> subcategorias) {
    return ExpansionTile(
      title: Text(categoria),
      children: _itemsSubcategoria(subcategorias),
    );
  }

  List<Widget> _itemsSubcategoria(List<String> subcategorias) {
    List<Widget> lista = [];

    subcategorias.forEach((element) {
      lista.add(ListTile(
        title: Text(element),
      ));
    });

    return lista;
  }

  ListTile _itemDrawer(String texto, IconData icono, {Function ontap}) {
    return ListTile(
      leading: Icon(icono),
      title: Text(texto),
      onTap: ontap,
    );
  }

  List<Widget> _crearItemsMenu() {
    return [
      _headerDrawer(),
      /*_itemDrawer('Iniciar Sesion', Icons.perm_identity),
      _itemDrawer('Profile', Icons.account_circle),
      _itemDrawer('Settings', Icons.settings),*/
      _itemCategoria('Cemento', ['Cemento Blanco', 'Cemento Extra']),
      _itemCategoria(
          'Acero', ['Alambre y alambron', 'Castillo', 'Malla Electrosoldada']),
      _itemCategoria('Otro Materiales', ['Cemento Blanco', 'Cemento Extra']),
      _itemCategoria('Acabados', ['Cemento Blanco', 'Cemento Extra']),
    ];
  }

  Widget _logoCarrito() {
    return InkWell(
      child: Row(
        children: [
          Icon(
            Icons.shopping_cart,
            color: Colors.white,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "0 Artículos",
                style: TextStyle(fontSize: 10.0, color: Colors.white),
              ),
              Text(
                "\$ 0.00",
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
            ],
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, '/carrito');
      },
    );
  }

  _mostrarFormulario(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final usuariosProviders = UsuariosProviders();
    String _usuario = '';
    String _password = '';
    String _empresa = '';
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.grey[200],
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(width: 20.0),
              Icon(Icons.account_box, color: Colors.blue)
            ],
          ),
          content: Stack(
            overflow: Overflow.visible,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: Icon(Icons.account_circle),
                          labelText: 'Usuario',
                          contentPadding: EdgeInsetsDirectional.only(
                              top: 5.0, bottom: 0.0, start: 5.0, end: 5.0),
                        ),
                        onChanged: (value) {
                          _usuario = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Usuario';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Contraseña',
                          contentPadding: EdgeInsetsDirectional.only(
                              top: 5.0, bottom: 0.0, start: 5.0, end: 5.0),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          _password = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Password';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          prefixIcon: Icon(Icons.business),
                          labelText: 'No Empresa',
                          contentPadding: EdgeInsetsDirectional.only(
                              top: 5.0, bottom: 0.0, start: 5.0, end: 5.0),
                        ),
                        obscureText: true,
                        onChanged: (value) {
                          _empresa = value;
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Empresa ';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.blue,
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            final res = await usuariosProviders.login(
                                _usuario, _password, _empresa);

                            if (res['resp']) {
                              var nombre = res['msg'].toString().split(' ');
                              _guardarUsuario(nombre[1]);
                              setState(() {});
                              Navigator.pop(context);
                            } else {
                              print(res['msg']);
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Informacion incorrecta'),
                                      content: Text(res['msg']),
                                      actions: [
                                        FlatButton(
                                          onPressed: () =>
                                              Navigator.of(context).pop(),
                                          child: Text("Ok"),
                                        )
                                      ],
                                    );
                                  });
                            }

                            setState(() {});
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  _listaCategorias() {
    Map<dynamic, dynamic> datos = {};
    List<Widget> items = [];
    categorias.forEach((key, value) {
      switch (key.length) {
        case 2:
          datos[key] = value;
          break;
        case 4:
          {}
          break;
        case 6:
          break;
      }
    });
    print(datos);
  }

  _nombreUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _usuario = prefs.getString('usuario');
    if (_usuario == null) {
      _usuario = 'Iniciar Sesion';
    }
    setState(() {});
  }

  _guardarUsuario(String usuario) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('usuario', usuario);
    _nombreUsuario();
  }

  _borrarUsuario() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('usuario');
    _nombreUsuario();
  }
}
