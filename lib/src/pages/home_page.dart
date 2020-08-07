import 'package:flutter/material.dart';
import 'package:tienda/src/components/cardProductos.dart';
import 'package:tienda/src/components/footer.dart';
import 'package:tienda/src/components/navbar.dart';
import 'package:tienda/src/components/sideBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              navBar(),
              _cuerpo(),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cuerpo() {
    return LayoutBuilder(builder: (context, constraints) {
      print(MediaQuery.of(context).size.width);
      double ancho = MediaQuery.of(context).size.width;
      if (ancho > 1024) {
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _menuLateral(),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 15.0),
                child: Column(
                  children: [
                    _filaProducto(),
                  ],
                ),
              )
            ],
          ),
        );
      } else if (ancho > 500 && ancho <= 1024) {
        print("500 - 1024");
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    _filaProductoTablet(400),
                    _filaProductoTablet(400),
                    _filaProductoTablet(400),
                  ],
                ),
              )
            ],
          ),
        );
      } else if (ancho <= 500) {
        return Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    _filaProductoMovil(400),
                    _filaProductoMovil(400),
                    _filaProductoMovil(400),
                    _filaProductoMovil(400),
                  ],
                ),
              )
            ],
          ),
        );
      }
    });
  }

  Widget _filaProducto() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CardProducto(
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          )
        ],
      ),
    );
  }

  Widget _filaProductoMovil(double ancho) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardProducto(
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            ancho: ancho,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
        ],
      ),
    );
  }

  Widget _filaProductoTablet(double ancho) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CardProducto(
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            ancho: ancho,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            ancho: ancho,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
        ],
      ),
    );
  }

  Widget _menuLateral() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SideBar(
            titulo: "Subcategorías",
            contenido: ["data", "data"],
          ),
          SideBar(
            titulo: "Marcas",
            contenido: ["data", "data"],
          ),
        ],
      ),
    );
  }
}
