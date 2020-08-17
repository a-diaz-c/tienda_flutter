import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tienda/src/models/categoria.dart';
import 'package:tienda/src/providers/usuarios_providers.dart';

class DrawerComponent extends StatefulWidget {
  @override
  _DrawerComponentState createState() => _DrawerComponentState();
}

class _DrawerComponentState extends State<DrawerComponent> {
  List<Categoria> lista = [];
  List<Map<String, dynamic>> categorias = [
    {'id': '10', 'nombre': 'Alimento'},
    {'id': '20', 'nombre': 'Bedidas'},
    {'id': '1010', 'nombre': 'Carnes'},
    {'id': '1010', 'nombre': 'Cecina'},
    {'id': '1010', 'nombre': 'Verduras'},
    {'id': '2010', 'nombre': 'Vinos'},
    {'id': '30', 'nombre': 'Ferreteria'},
    {'id': '3010', 'nombre': 'Tornillos'},
    {'id': '3020', 'nombre': 'Herramientas'},
    {'id': '2020', 'nombre': 'Refresco'},
    {'id': '202010', 'nombre': 'Azucar'},
    {'id': '202020', 'nombre': 'Sin Azucar'},
    {'id': '302010', 'nombre': 'Taladros'},
    {'id': '302020', 'nombre': 'Mecanicos'},
  ];
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

  ExpansionTile _itemCategoria(String categoria, List<dynamic> subcategorias) {
    return ExpansionTile(
      title: Text(categoria),
      children: _itemsSubcategoria(subcategorias),
    );
  }

  List<Widget> _itemsSubcategoria(List<Categoria> subcategorias) {
    List<Widget> lista = [];

    subcategorias.forEach((element) {
      lista.add(ListTile(
        title: Text(element.nombre),
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
      /* _itemCategoria('Cemento', ['Cemento Blanco', 'Cemento Extra']),
      _itemCategoria(
          'Acero', ['Alambre y alambron', 'Castillo', 'Malla Electrosoldada']),
      _itemCategoria('Otro Materiales', ['Cemento Blanco', 'Cemento Extra']),
      _itemCategoria('Acabados', ['Cemento Blanco', 'Cemento Extra']),*/
      ..._listarCategorias(lista),
    ];
  }

  List<Widget> _listarCategorias(List datos) {
    List<Widget> todo = [];
    datos.forEach((element) {
      if (element.hijos.length != 0) {
        todo.add(ExpansionTile(
          title: Text(element.nombre),
          children: _listarCategorias(element.hijos),
        ));
      } else {
        todo.add(ListTile(
          title: Text(element.nombre),
          onTap: () => print(element.nombre),
        ));
      }
    });
    return todo;
  }

  _ordenarCategorias() {
    categorias.forEach((element) {
      var profundidadCategoria = element['id'].toString().split('0');
      if (profundidadCategoria.length >= 2) {}
    });
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
    List<Map<dynamic, dynamic>> datos = [];

    List<Widget> items = [];
    categorias.forEach((element) {
      var division = element['id'].toString().split('0');
      if (division.length <= 2)
        lista.add(new Categoria.fromJson(element));
      else {
        switch (division.length) {
          case 3:
            {
              var index = lista.indexWhere((e) => e.id == division[0] + '0');

              if (index != -1) {
                print('Encontro ' + lista[index].nombre);
                print('hijo ' + element['nombre']);
                lista[index].addHijo(new Categoria.fromJson(element));
              }
            }
            break;
          case 4:
            {
              var index = lista.indexWhere((e) => e.id == division[0] + '0');
              var index2 = lista.indexWhere((e) => e.id == division[1] + '0');

              if (index != -1 && index2 != -1) {
                print('Encontro ' + lista[index].nombre);
                print('Hijo de ' + lista[index].hijos[index2].nombre);
                print('hijo ' + element['nombre']);
                lista[index]
                    .hijos[index2]
                    .addHijo(new Categoria.fromJson(element));
              }
            }
            break;
          default:
        }

        /*var index = lista.indexWhere((e) => e.id == division[0] + '0');

        if (index != -1) {
          print('Encontro ' + lista[index].nombre);
          print('hijo ' + element['nombre']);
          lista[index].addHijo(new Categoria.fromJson(element));
        }*/
      }
    });
    _mostrarElementos(lista);
  }

  _mostrarElementos(List<Categoria> lista) {
    lista.forEach((element) {
      print(element.nombre);

      _mostrarElementos(element.hijos);
    });
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
