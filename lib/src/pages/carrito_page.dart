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
  double subTotal;
  int cantidadProductos;
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
      "nombre": 'Truper, Clavo Negro 1" Para Concreto, Kilogramos',
      "precio": 36.00,
      "cantidad": 2,
    },
    {
      "imagen":
          "https://www.construrama.com/medias/?context=bWFzdGVyfGltYWdlc3w0NDcyN3xpbWFnZS9qcGVnfGltYWdlcy9oYmEvaGI1Lzg4NTQ0OTExNjg3OTguanBnfDE4ZjIzY2ZkMmZhNjUxZDZmYTZiOGM1ZGU1ZDI4YTliMDc0ZGIwMzcxZTAwOWY3Mjc5MmVjZmJlMTA3NjlhNWE",
      "nombre": 'Truper, Clavo Negro 3" Para Concreto, Kilogramos',
      "precio": 36.00,
      "cantidad": 1,
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
                              padding: EdgeInsets.all(10),
                              child: Text(
                                "Carrito",
                                style: TextStyle(
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                          height: 10,
                          thickness: 2.5,
                          indent: 20,
                        ),
                        ...cargarProductos(),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "Subtotal ($cantidadProductos Productos) ",
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                  Text(
                                    '\$' + subTotal.toStringAsFixed(2),
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                              RaisedButton(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.black)),
                                child: Text(
                                  "Proceder al pago",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12.0),
                                ),
                                color: Colors.amber[400],
                                onPressed: () {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                        )
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
    subTotal = 0;
    cantidadProductos = 0;
    List<Widget> filas = [];
    for (var i = 0; i < datos.length; i++) {
      filas.add(_producto(i));
      filas.add(
        Divider(
          color: Colors.grey,
          height: 2.5,
          thickness: 1,
          indent: 20,
        ),
      );
      subTotal += datos[i]['precio'] * datos[i]['cantidad'];
      cantidadProductos += datos[i]['cantidad'];
    }
    return filas;
  }

  Widget _producto(int index) {
    TextEditingController _myController = TextEditingController()
      ..text = datos[index]['cantidad'].toString();
    double precio = datos[index]['precio'];
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 200,
            height: 200,
            child: Image(
              image: NetworkImage(datos[index]['imagen']),
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
                    datos[index]['nombre'],
                    style:
                        TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Precio  \$ ' + precio.toStringAsFixed(2),
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Text("Cantidad "),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        int cantidad = datos[index]['cantidad']++;

                        _myController.text = cantidad.toString();
                        setState(() {});
                      },
                    ),
                    Container(
                      width: 40,
                      height: 25,
                      child: TextField(
                        controller: _myController,
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
                        onChanged: (texto) {
                          setState(() {});
                        },
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: () {
                          if (datos[index]['cantidad'] > 1) {
                            datos[index]['cantidad']--;
                          }

                          _myController.text =
                              datos[index]['cantidad'].toString();
                          setState(() {});
                        }),
                  ],
                ),
                Container(
                  height: 25,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: BorderSide(color: Colors.red)),
                    child: Text(
                      "Eliminar",
                      style: TextStyle(color: Colors.red, fontSize: 12.0),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      datos.removeAt(index);
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
