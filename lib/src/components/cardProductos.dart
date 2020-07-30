import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardProducto extends StatefulWidget {
  String imagen;
  String nombre;
  double precio;

  CardProducto(
      {Key key,
      @required this.imagen,
      @required this.nombre,
      @required this.precio});

  @override
  _CardProductoState createState() =>
      _CardProductoState(imagen: imagen, nombre: nombre, precio: precio);
}

class _CardProductoState extends State<CardProducto> {
  String imagen;
  String nombre;
  double precio;
  int _conteo = 1;
  double _total = 0;
  TextEditingController _myController = TextEditingController()..text = "1";

  _CardProductoState(
      {Key key,
      @required this.imagen,
      @required this.nombre,
      @required this.precio}) {
    _total = precio;
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        width: 250,
        height: 350,
        padding: EdgeInsets.all(10.0),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _imagen(),
              _nombre(),
              _precio(),
              _cantidad(),
              _botonAgregar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _imagen() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Image(
            image: NetworkImage(this.imagen),
            height: 150,
            width: 100,
          ),
        ),
      ],
    );
  }

  Widget _nombre() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(this.nombre),
        ),
      ],
    );
  }

  Widget _precio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text('\$ $precio'),
        ),
      ],
    );
  }

  Widget _cantidad() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Cant"),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _conteo++;
              _myController.text = _conteo.toString();
              _total = precio * _conteo;
              print(_total);
              setState(() {});
            },
          ),
          Flexible(
            child: Container(
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
                  _conteo = int.parse(texto);
                  _total = precio * _conteo;
                  setState(() {});
                },
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              if (_conteo > 1) {
                _conteo--;
              }

              _myController.text = _conteo.toString();
              _total = precio * _conteo;
              print(_total);

              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget _botonAgregar() {
    return Container(
      width: 200,
      height: 20,
      child: RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Agregar $_conteo"),
            Text("\$$_total"),
          ],
        ),
        onPressed: () {
          print("Total de productos $_conteo por $_total");
        },
      ),
    );
  }
}
