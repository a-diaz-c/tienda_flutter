import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tienda/src/components/footer.dart';
import 'package:tienda/src/components/navbar.dart';

class CarritoPage extends StatefulWidget {
  CarritoPage({Key key}) : super(key: key);

  @override
  _CarritoPageState createState() => _CarritoPageState();
}

class _CarritoPageState extends State<CarritoPage> {
  List<Map<String, dynamic>> datos = [
    {
      "imagen":
          "https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE",
      "nombre": 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
      "precio": 36.00,
      "cantidad": 2,
    },
    {
      "imagen":
          "https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE",
      "nombre": 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
      "precio": 36.00,
      "cantidad": 2,
    },
    {
      "imagen":
          "https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE",
      "nombre": 'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
      "precio": 36.00,
      "cantidad": 2,
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              navBar(context),
              LayoutBuilder(builder: (context, constraints) {
                if (MediaQuery.of(context).size.width > 900) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.75,
                    padding:
                        EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Text(
                                "Carrito",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ...cargarProductos(),
                      ],
                    ),
                  );
                } else {
                  return Container();
                }
              }),
              footer(),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> cargarProductos() {
    List<Widget> filas = [];
    for (var dato in datos) {
      filas.add(_producto());
    }
    return filas;
  }

  Widget _producto() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 250,
          height: 250,
          child: Image(
            image: NetworkImage(
                "https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE"),
          ),
        ),
        SizedBox(width: 10.0),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Truper, Clavo Negro 2" Para Concreto, Kilogramos',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'Precio  \$ 36.00',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Text("Cantidad "),
                  IconButton(icon: Icon(Icons.add), onPressed: null),
                  Container(
                    width: 40,
                    height: 25,
                    child: TextField(
                      maxLength: 5,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 5.0,
                        ),
                        counterText: '',
                      ),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12.0,
                      ),
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly,
                      ],
                    ),
                  ),
                  IconButton(icon: Icon(Icons.remove), onPressed: null),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
