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
          CardProducto(
            nombre: 'Block 15X20X40 cm, Pieza',
            precio: 7.75,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3wyMDEwMnxpbWFnZS9qcGVnfGltYWdlcy9oOTUvaDRhLzg4Njc5OTM2MTY0MTQuanBnfDkwZTBlZmNmNjAwYjIyNDkxZTI2MWNlY2Y2Njc2ODA1N2VkYWQ5ZjExMjFlYWNlZTZmMzE3NjE4MzdlOGNhNTU',
          ),
          CardProducto(
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            nombre: 'Block 15X20X40 cm, Pieza',
            precio: 7.75,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3wyMDEwMnxpbWFnZS9qcGVnfGltYWdlcy9oOTUvaDRhLzg4Njc5OTM2MTY0MTQuanBnfDkwZTBlZmNmNjAwYjIyNDkxZTI2MWNlY2Y2Njc2ODA1N2VkYWQ5ZjExMjFlYWNlZTZmMzE3NjE4MzdlOGNhNTU',
          ),
          CardProducto(
            nombre: 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
            precio: 36.00,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE',
          ),
          CardProducto(
            nombre: 'Block 15X20X40 cm, Pieza',
            precio: 7.75,
            imagen:
                'https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3wyMDEwMnxpbWFnZS9qcGVnfGltYWdlcy9oOTUvaDRhLzg4Njc5OTM2MTY0MTQuanBnfDkwZTBlZmNmNjAwYjIyNDkxZTI2MWNlY2Y2Njc2ODA1N2VkYWQ5ZjExMjFlYWNlZTZmMzE3NjE4MzdlOGNhNTU',
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
