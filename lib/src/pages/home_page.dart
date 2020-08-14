import 'package:flutter/material.dart';
import 'package:tienda/src/components/cardProductos.dart';
import 'package:tienda/src/components/drawer.dart';
import 'package:tienda/src/components/footer.dart';
import 'package:tienda/src/components/navbar.dart';
import 'package:tienda/src/components/sideBar.dart';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _rrectController = ScrollController();
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
                  children: [
                    _filaProductoLargo(anchoContendorProductos),
                    _filaProductoLargo(anchoContendorProductos),
                    _filaProductoLargo(anchoContendorProductos),
                    _filaProductoLargo(anchoContendorProductos),
                  ],
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
                  children: [
                    _filaProductoMediana(anchoContendorProductos),
                    _filaProductoMediana(anchoContendorProductos),
                    _filaProductoMediana(anchoContendorProductos),
                  ],
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
                  children: [
                    _filaProductoChica(anchoContendorProductos),
                    _filaProductoChica(anchoContendorProductos),
                    _filaProductoChica(anchoContendorProductos),
                  ],
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
                  children: [
                    _filaProductoExtraChica(anchoContendorProductos),
                    _filaProductoExtraChica(anchoContendorProductos),
                    _filaProductoExtraChica(anchoContendorProductos),
                    _filaProductoExtraChica(anchoContendorProductos),
                  ],
                ),
              )
            ],
          ),
        );
      }
    });
  }

  Widget _filaProductoLargo(double ancho) {
    double anchoCard = ancho / 4;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CardProducto(
            ancho: anchoCard,
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            ancho: anchoCard,
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            ancho: anchoCard,
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            ancho: anchoCard,
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          )
        ],
      ),
    );
  }

  Widget _filaProductoExtraChica(double ancho) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardProducto(
            ancho: ancho,
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
        ],
      ),
    );
  }

  Widget _filaProductoMediana(double ancho) {
    double anchoCard = ancho / 3;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardProducto(
            ancho: anchoCard,
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            ancho: anchoCard,
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            ancho: anchoCard,
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
        ],
      ),
    );
  }

  Widget _filaProductoChica(double ancho) {
    double anchoCard = ancho / 2;
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardProducto(
            ancho: anchoCard,
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            ancho: anchoCard,
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
        ],
      ),
    );
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
