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
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            navBar(),
            _cuerpo(),
            footer(),
          ],
        ),
      ),
    );
  }

  Widget _cuerpo() {
    return Container(
      child: Row(
        children: [
          _menuLateral(),
          Column(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                if (MediaQuery.of(context).size.width < 1178) {
                  return Row(
                    children: [
                      CardProducto(
                        nombre:
                            'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
                        precio: 36.00,
                        imagen:
                            'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
                      ),
                      CardProducto(
                        nombre:
                            'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
                        precio: 36.00,
                        imagen:
                            'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
                      ),
                    ],
                  );
                } else {
                  print(MediaQuery.of(context).size.width);
                  return Row(
                    children: [
                      CardProducto(
                        nombre:
                            'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
                        precio: 36.00,
                        imagen:
                            'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
                      ),
                      CardProducto(
                        nombre:
                            'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
                        precio: 36.00,
                        imagen:
                            'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
                      ),
                      CardProducto(
                        nombre:
                            'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
                        precio: 36.00,
                        imagen:
                            'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
                      ),
                      CardProducto(
                        nombre:
                            'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
                        precio: 36.00,
                        imagen:
                            'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
                      ),
                    ],
                  );
                }
              }),
            ],
          )
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
