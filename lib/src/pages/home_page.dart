import 'package:flutter/material.dart';
import 'package:tienda/src/components/cardProductos.dart';
import 'package:tienda/src/components/drawer.dart';
import 'package:tienda/src/components/footer.dart';
import 'package:tienda/src/components/navbar.dart';
import 'package:tienda/src/components/sideBar.dart';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:tienda/src/providers/productos_providers.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List productos;
  ProductosProviders providers = ProductosProviders();
  ScrollController _rrectController = ScrollController();
  @override
  void initState() {
    super.initState();
    productos = providers.jsonProductos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerComponent(),
      body: DraggableScrollbar.rrect(
        alwaysVisibleScrollThumb: true,
        controller: _rrectController,
        backgroundColor: Colors.grey[300],
        child: ListView(
          controller: _rrectController,
          children: [
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Navbar(),
                  _cuerpo(),
                  footer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cuerpo() {
    return LayoutBuilder(builder: (context, constraints) {
      print(MediaQuery.of(context).size.width);
      double ancho = MediaQuery.of(context).size.width;
      if (ancho > 1250) {
        double anchoContendorProductos =
            MediaQuery.of(context).size.width * 0.85;
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _menuLateral(),
              Container(
                width: anchoContendorProductos,
                padding: EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
                child: Column(
                  children: _mostrarProductos(anchoContendorProductos, 5),
                ),
              )
            ],
          ),
        );
      } else if (ancho > 825 && ancho <= 1250) {
        double anchoContendorProductos =
            MediaQuery.of(context).size.width * 0.85;
        print("500 - 1250");
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: _mostrarProductos(anchoContendorProductos, 3),
                ),
              )
            ],
          ),
        );
      } else if (ancho > 500 && ancho <= 825) {
        double anchoContendorProductos =
            MediaQuery.of(context).size.width * 0.85;
        print("500 - 825");
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: _mostrarProductos(anchoContendorProductos, 2),
                ),
              )
            ],
          ),
        );
      } else if (ancho <= 500) {
        double anchoContendorProductos =
            MediaQuery.of(context).size.width * 0.70;
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: _filaProductoExtraChica(anchoContendorProductos),
                ),
              )
            ],
          ),
        );
      }
    });
  }

  List<Widget> _mostrarProductos(double ancho, int cantidadFila) {
    Map<int, int> maxNombre = {
      5: 120,
      3: 100,
      2: 100,
    };
    double anchoCard = ancho / cantidadFila;
    List<Widget> widgetProductos = [];
    List<Widget> row = [];
    for (int i = 0; i < productos.length; i++) {
      String nuevoNombre =
          _recortarTexto(productos[i]['nombre'], maxNombre[cantidadFila]);
      if ((i + 1) % cantidadFila == 0) {
        row.add(
          CardProducto(
            ancho: anchoCard,
            nombre: nuevoNombre,
            precio: double.parse(productos[i]['precio']),
            imagen: productos[i]['imagen'],
            id: productos[i]['clave_producto'],
          ),
        );
        widgetProductos.add(
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: row,
            ),
          ),
        );
        row = [];
      } else {
        row.add(
          CardProducto(
            ancho: anchoCard,
            nombre: nuevoNombre,
            precio: double.parse(productos[i]['precio']),
            imagen: productos[i]['imagen'],
            id: productos[i]['clave_producto'],
          ),
        );
      }
    }
    if (row.length != 0) {
      widgetProductos.add(
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: row,
          ),
        ),
      );
    }
    return widgetProductos;
  }

  List<Widget> _filaProductoExtraChica(double ancho) {
    List<Widget> widgetProductos = [];
    productos.forEach((element) {
      String nuevoNombre = _recortarTexto(element['nombre'], 120);
      widgetProductos.add(Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CardProducto(
              ancho: ancho,
              nombre: nuevoNombre,
              precio: double.parse(element['precio']),
              imagen: element['imagen'],
              id: element['id'],
            ),
          ],
        ),
      ));
    });
    return widgetProductos;
  }

  String _recortarTexto(String texto, int maximo) {
    String nuevoTexto;
    if (texto.length > maximo) {
      nuevoTexto = texto.substring(0, maximo) + '...';
      return nuevoTexto;
    }
    return texto;
  }

  Widget _menuLateral() {
    return Container(
      width: MediaQuery.of(context).size.width * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideBar(
            titulo: "Categorías",
            contenido: ["Cemento", "Aceros"],
          ),
          SideBar(
            titulo: "Marcas",
            contenido: ["Bronco", "Anclo"],
          ),
        ],
      ),
    );
  }
}
