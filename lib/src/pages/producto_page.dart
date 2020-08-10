import 'dart:js';

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
    double _anchoPantalla = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          navBar(context),
          LayoutBuilder(builder: (context, constraints) {
            if (MediaQuery.of(context).size.width > 900) {
              return _cardProducto(_anchoPantalla * 0.75);
            } else {
              return _cardProductoMovil(_anchoPantalla * 0.90);
            }
          }),
          _cardCalificacion(_anchoPantalla * 0.75),
          footer(),
        ],
      )),
    );
  }

  Widget _cardProducto(double ancho) {
    double anchoImagen = ancho * 0.60;
    return Center(
      child: Container(
        width: ancho,
        padding: EdgeInsets.symmetric(vertical: 50.0),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _imagenProducto(anchoImagen),
                    _textosProducto(35.0),
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
                                  fontWeight: FontWeight.bold, fontSize: 18.0),
                            ),
                            SizedBox(height: 10),
                            _tablaTecnica(),
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
    );
  }

  Widget _cardProductoMovil(double ancho) {
    return Center(
      child: Container(
        width: ancho,
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 20.0),
          child: Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _imagenProducto(ancho * 0.80),
                  ],
                ),
                Row(
                  children: [
                    _textosProducto(20.0),
                  ],
                ),
                _tablaTecnicaMovil(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _imagenProducto(double ancho) {
    return Container(
      child: Image.network(
        "https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE",
        width: ancho,
      ),
    );
  }

  Widget _textosProducto(double sizeTitulo) {
    double textDatosProductos = sizeTitulo * 0.60;
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _nombreProducto(sizeTitulo),
          SizedBox(height: 20.0),
          Container(
            child: Row(
              children: [
                Text(
                  "Marca: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: textDatosProductos),
                ),
                Text(
                  "TRUPER",
                  style: TextStyle(fontSize: textDatosProductos),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "Marca: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: textDatosProductos),
                ),
                Text(
                  "CMA0301050027",
                  style: TextStyle(fontSize: textDatosProductos),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Text(
                  "Unidad de venta: ",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: textDatosProductos),
                ),
                Text(
                  "Kilos",
                  style: TextStyle(fontSize: textDatosProductos),
                )
              ],
            ),
          ),
          _iconos(
              Icons.local_shipping,
              "Envíos Gratis",
              "Monto mínimo de compra puede variar por tienda y zona",
              sizeTitulo * 1.42,
              colorTexto: Colors.orange),
          SizedBox(height: 15.0),
          _iconos(Icons.verified_user, "Garantía Construrama",
              "Seguridad en todas tus compras", sizeTitulo * 1.42,
              colorTexto: Colors.green),
          SizedBox(height: 15.0),
          _iconos(
              Icons.local_post_office,
              "Click & Pick up",
              "Compra en línea y recoge tu pedido en tienda",
              sizeTitulo * 1.42),
          SizedBox(height: 40.0),
          _caracteristicasProducto(sizeTitulo),
        ],
      ),
    );
  }

  Widget _nombreProducto(double size) {
    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Text(
        'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
        style: TextStyle(fontSize: size, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _caracteristicasProducto(double sizeTexto) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(
            'Características',
            style: TextStyle(
                fontSize: sizeTexto * 0.571, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          child: Text(
            'Clavo negro para concreto de 2 pulgadas (50.8 Mm). Fabricado en acero al carbono. Con cuerpo rolado especial que facilita la penetración y proporciona mayor resistencia.',
            style: TextStyle(fontSize: sizeTexto * 0.50),
          ),
        ),
      ],
    );
  }

  Widget _iconos(IconData icono, String titulo, String subtitulo, double size,
      {Color colorTexto}) {
    if (colorTexto == null) colorTexto = Colors.black;
    return Container(
      child: Row(
        children: [
          Icon(
            icono,
            size: size,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titulo,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size * 0.40,
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

  Widget _tablaTecnica() {
    return Table(
      border: TableBorder(
        horizontalInside:
            BorderSide(width: 1, color: Colors.grey, style: BorderStyle.solid),
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
    );
  }

  Widget _tablaTecnicaMovil() {
    return Table(
      border: TableBorder(
        horizontalInside:
            BorderSide(width: 1, color: Colors.grey, style: BorderStyle.solid),
      ),
      children: [
        TableRow(children: [
          ..._textTabla(
            "Usos",
            "Para la construcción de muros y paredes.",
          ),
        ]),
        TableRow(children: [
          ..._textTabla("Altura", "15 cm"),
        ]),
        TableRow(children: [
          ..._textTabla("Ancho", "20 cm"),
        ]),
        TableRow(children: [
          ..._textTabla("Longitud", "40 cm"),
        ]),
        TableRow(children: [
          ..._textTabla("Material", "Concreto"),
        ]),
        TableRow(children: [
          ..._textTabla("Material", "Concreto"),
        ])
      ],
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

  Widget _cardCalificacion(double ancho) {
    return Center(
      child: Container(
        width: ancho,
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
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                ),
                LayoutBuilder(builder: (context, constraints) {
                  print(MediaQuery.of(context).size.width);
                  if (MediaQuery.of(context).size.width > 900) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: ancho / 2,
                          padding: EdgeInsets.only(left: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _puntiacion(MainAxisAlignment.start, 50.0),
                              _totalCalificaciones(MainAxisAlignment.start),
                              _puntuajePorEstrella(
                                  5, 0.8, 10, MainAxisAlignment.start, 100),
                              _puntuajePorEstrella(
                                  4, 0.2, 2, MainAxisAlignment.start, 100),
                              _puntuajePorEstrella(
                                  3, 0.0, 0, MainAxisAlignment.start, 100),
                              _puntuajePorEstrella(
                                  2, 0, 0, MainAxisAlignment.start, 100),
                              _puntuajePorEstrella(
                                  1, 0, 0, MainAxisAlignment.start, 100),
                            ],
                          ),
                        ),
                        SizedBox(width: 20.0),
                        _seccionComentarios(MainAxisAlignment.center),
                      ],
                    );
                  } else {
                    return Column(
                      children: [
                        _puntiacion(MainAxisAlignment.center, 25.0),
                        _totalCalificaciones(
                          MainAxisAlignment.center,
                        ),
                        _puntuajePorEstrella(
                            5, 0.8, 10, MainAxisAlignment.center, 100),
                        _puntuajePorEstrella(
                            4, 0.2, 2, MainAxisAlignment.center, 100),
                        _puntuajePorEstrella(
                            3, 0.0, 0, MainAxisAlignment.center, 100),
                        _puntuajePorEstrella(
                            2, 0, 0, MainAxisAlignment.center, 100),
                        _puntuajePorEstrella(
                            1, 0, 0, MainAxisAlignment.center, 100),
                        InkWell(
                          child: Text(
                            "Ver todos los comentarios",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          onTap: () => {},
                        )
                      ],
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _puntiacion(MainAxisAlignment main, double size) {
    return Row(
      mainAxisAlignment: main,
      children: [
        Text(
          "3.0",
          style: TextStyle(
              fontSize: size,
              fontWeight: FontWeight.bold,
              color: Colors.blue[900]),
        ),
        IconTheme(
          data: IconThemeData(
            color: Colors.amber,
            size: size,
          ),
          child: StarDisplay(value: 3),
        )
      ],
    );
  }

  Widget _totalCalificaciones(MainAxisAlignment main) {
    return Row(
      mainAxisAlignment: main,
      children: [
        Text(
          "12 calificaciones",
          style: TextStyle(fontSize: 18.0),
        )
      ],
    );
  }

  Widget _puntuajePorEstrella(int numeroEstrella, double porcentaje,
      int comentarios, MainAxisAlignment main, double ancho) {
    return Row(
      mainAxisAlignment: main,
      children: [
        Icon(Icons.star),
        Text(numeroEstrella.toString()),
        LinearPercentIndicator(
          width: ancho,
          lineHeight: 12.0,
          percent: porcentaje,
          progressColor: Colors.green[600],
        ),
        Text(comentarios.toString())
      ],
    );
  }

  Widget _seccionComentarios(MainAxisAlignment main) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: main,
          children: [
            Container(
                padding: EdgeInsets.only(right: 10.0),
                child: Text(
                  "Comentarios recientes",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            InkWell(
              child: Text("Ver todos"),
              onTap: () => {},
            )
          ],
        ),
        _comentario(main),
        _comentario(main),
      ],
    );
  }

  Widget _comentario(MainAxisAlignment main) {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: main,
            children: [
              StarDisplay(
                value: 5,
                tamanio: 20,
              )
            ],
          ),
          SizedBox(height: 3.0),
          Row(
            mainAxisAlignment: main,
            children: [Text("Satisfecho con mi compra")],
          ),
          SizedBox(height: 3.0),
          Row(
            mainAxisAlignment: main,
            children: [
              Text("23/04/20"),
            ],
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
