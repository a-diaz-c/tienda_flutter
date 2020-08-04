import 'package:flutter/material.dart';
import 'package:tienda/src/components/footer.dart';
import 'package:tienda/src/components/navbar.dart';

class ProductoPage extends StatefulWidget {
  ProductoPage({Key key}) : super(key: key);

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  @override
  Widget build(BuildContext context) {
    double _anchoContainerProducto = MediaQuery.of(context).size.width * 0.60;
    double _anchoImagen = _anchoContainerProducto * 0.60;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          navBar(),
          Center(
            child: Container(
              width: _anchoContainerProducto,
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Image.network(
                            "https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE",
                            width: _anchoImagen,
                          ),
                        ),
                        Flexible(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Text(
                                  'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
                                  style: TextStyle(
                                      fontSize: 35.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Marca: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("TRUPER")
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Marca: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("CMA0301050027")
                                  ],
                                ),
                              ),
                              Container(
                                child: Row(
                                  children: [
                                    Text(
                                      "Unidad de venta: ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("Kilos")
                                  ],
                                ),
                              ),
                              _iconos(Icons.local_shipping, "Envíos Gratis",
                                  "Monto mínimo de compra puede variar por tienda y zona",
                                  colorTexto: Colors.orange),
                              SizedBox(height: 15.0),
                              _iconos(
                                  Icons.verified_user,
                                  "Garantía Construrama",
                                  "Seguridad en todas tus compras",
                                  colorTexto: Colors.green),
                              SizedBox(height: 15.0),
                              _iconos(
                                  Icons.local_post_office,
                                  "Click & Pick up",
                                  "Compra en línea y recoge tu pedido en tienda"),
                              SizedBox(height: 40.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      'Características',
                                      style: TextStyle(
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Clavo negro para concreto de 2 pulgadas (50.8 Mm). Fabricado en acero al carbono. Con cuerpo rolado especial que facilita la penetración y proporciona mayor resistencia.',
                                      style: TextStyle(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                "Especificaciones técnicas",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          footer(),
        ],
      )),
    );
  }

  Widget _iconos(IconData icono, String titulo, String subtitulo,
      {Color colorTexto}) {
    if (colorTexto == null) colorTexto = Colors.black;
    return Container(
      child: Row(
        children: [
          Icon(
            icono,
            size: 50.0,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                      color: colorTexto),
                ),
                Text(subtitulo)
              ],
            ),
          )
        ],
      ),
    );
  }
}
