import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardProducto extends StatefulWidget {
  String imagen;
  String nombre;
  double precio;
  double ancho;

  CardProducto(
      {Key key,
      @required this.imagen,
      @required this.nombre,
      @required this.precio,
      this.ancho = 250}) {}

  @override
  _CardProductoState createState() => _CardProductoState();
}

class _CardProductoState extends State<CardProducto> {
  /*String imagen;
  String nombre;
  double precio;
  double ancho;*/
  int _conteo = 1;
  double _total = 0;
  TextEditingController _myController = TextEditingController()..text = "1";

  _CardProductoState({
    Key key,
    /*@required this.imagen,
      @required this.nombre,
      @required this.precio,
      this.ancho = 250*/
  }) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.ancho - 10,
      height: widget.ancho * 1.4,
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              child: _imagen(widget.ancho - 10),
              onTap: () {
                Navigator.pushNamed(context, '/producto');
              },
            ),
            InkWell(
              child: _nombre(),
              onTap: () {
                Navigator.pushNamed(context, '/producto');
              },
            ),
            _precio(),
            _cantidad(),
            _botonAgregar(),
          ],
        ),
      ),
    );
  }

  Widget _imagen(double ancho) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Image(
            image: NetworkImage(widget.imagen),
            height: ancho * 0.60,
            width: ancho * 0.40,
          ),
        ),
      ],
    );
  }

  Widget _nombre() {
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Text(widget.nombre),
    );
  }

  Widget _precio() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('\$ ' + widget.precio.toString()),
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
              _total = widget.precio * _conteo;
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
                  _total = widget.precio * _conteo;
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
              _total = widget.precio * _conteo;
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
