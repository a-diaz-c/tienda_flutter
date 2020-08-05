import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

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
    double _anchoContainerProducto = MediaQuery.of(context).size.width * 0.75;
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
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Especificaciones técnicas",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                                SizedBox(height: 10),
                                Table(
                                  border: TableBorder(
                                    horizontalInside: BorderSide(
                                        width: 1,
                                        color: Colors.grey,
                                        style: BorderStyle.solid),
                                  ),
                                  children: [
                                    TableRow(children: [
                                      ..._textTabla(
                                        "Usos",
                                        "Para la construcción de muros y paredes.",
                                      ),
                                      ..._textTabla("Altura", "15 cm"),
                                    ]),
                                    TableRow(children: [
                                      ..._textTabla("Ancho", "20 cm"),
                                      ..._textTabla("Longitud", "40 cm"),
                                    ]),
                                    TableRow(children: [
                                      ..._textTabla("Material", "Concreto"),
                                      ..._textTabla("", ""),
                                    ])
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              width: _anchoContainerProducto,
              padding: EdgeInsets.only(bottom: 20.0),
              child: Card(
                margin: EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Calificación de producto",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: _anchoContainerProducto / 2,
                            padding: EdgeInsets.only(left: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "3.0",
                                      style: TextStyle(
                                          fontSize: 50.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue[900]),
                                    ),
                                    IconTheme(
                                      data: IconThemeData(
                                        color: Colors.amber,
                                        size: 48,
                                      ),
                                      child: StarDisplay(value: 3),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "12 calificaciones",
                                      style: TextStyle(fontSize: 18.0),
                                    )
                                  ],
                                ),
                                Row(children: [
                                  Icon(Icons.star),
                                  Text("5"),
                                  LinearPercentIndicator(
                                    width: 200.0,
                                    lineHeight: 12.0,
                                    percent: 0.9,
                                    progressColor: Colors.green[600],
                                  )
                                ]),
                                Row(children: [Icon(Icons.star), Text("4")]),
                                Row(children: [Icon(Icons.star), Text("3")]),
                                Row(children: [Icon(Icons.star), Text("2")]),
                                Row(children: [Icon(Icons.star), Text("1")]),
                              ],
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      padding: EdgeInsets.only(right: 10.0),
                                      child: Text(
                                        "Comentarios recientes",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      )),
                                  InkWell(
                                    child: Text("Ver todos"),
                                    onTap: () => {},
                                  )
                                ],
                              ),
                              _comentario(),
                              _comentario(),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          footer(),
        ],
      )),
    );
  }

  Widget _comentario() {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              StarDisplay(
                value: 5,
                tamanio: 20,
              )
            ],
          ),
          SizedBox(height: 3.0),
          Row(
            children: [Text("Satisfecho con mi compra")],
          ),
          SizedBox(height: 3.0),
          Row(
            children: [
              Text("23/04/20"),
            ],
          )
        ],
      ),
    );
  }

  List<Widget> _textTabla(String titulo, String contenido) {
    return [
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          color: Colors.grey[200],
          child: Text(
            titulo,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(contenido)),
    ];
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

class StarDisplay extends StatelessWidget {
  final int value;
  final double tamanio;
  const StarDisplay({Key key, this.value = 0, this.tamanio})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          size: tamanio,
        );
      }),
    );
  }
}
