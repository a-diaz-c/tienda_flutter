import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tienda/src/providers/productos_providers.dart';

class CardProducto extends StatefulWidget {
  final void Function() parentAction;

  String imagen;
  String nombre;
  double precio;
  double ancho;
  String id;

  CardProducto({
    Key key,
    @required this.imagen,
    @required this.nombre,
    @required this.precio,
    @required this.id,
    this.ancho = 250,
    this.parentAction,
  });

  @override
  _CardProductoState createState() => _CardProductoState();
}

class _CardProductoState extends State<CardProducto> {
  int _conteo = 1;
  double _total = 0;
  TextEditingController _controller = TextEditingController()..text = "1";

  _CardProductoState({
    Key key,
  });

  @override
  Widget build(BuildContext context) {
    var clave = widget.id;
    return Container(
      width: widget.ancho - 10,
      height: widget.ancho * 1.3,
      padding: EdgeInsets.all(10.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              child: _imagen(widget.ancho - 10),
              onTap: () {
                Navigator.pushNamed(context, 'producto/$clave');
              },
            ),
            InkWell(
              child: _nombre(),
              onTap: () {
                Navigator.pushNamed(context, 'producto/$clave');
              },
            ),
            _precio(),
            //_cantidad(),
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
            height: ancho * 0.50,
            width: ancho * 0.50,
          ),
        ),
      ],
    );
  }

  Widget _nombre() {
    String nuevonombre = _recortarTexto(widget.nombre);
    return Container(
      padding: EdgeInsets.all(5.0),
      child: Text(
        nuevonombre,
        style:
            TextStyle(fontWeight: FontWeight.normal, color: Colors.blue[800]),
      ),
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

  /* Widget _cantidad() {
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
                  // ignore: deprecated_member_use
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
  } */

  Widget _botonAgregar() {
    return Container(
      width: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _inputCantidad(),
          SizedBox(width: 5.0),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.shopping_cart,
                  size: 14.0,
                ),
                Text(" Agregar", style: TextStyle(fontSize: 13.0)),
              ],
            ),
            onPressed: () {
              Map<String, dynamic> producto = {
                'id': widget.id,
                'nombre': widget.nombre,
                'precio': widget.precio,
                'imagen': widget.imagen,
                'cantidad': int.parse(_controller.text),
              };
              if (_controller.text != '0') {
                ProductosProviders providers = ProductosProviders();
                providers.addProductoCarrito(producto);
                widget.parentAction();
                //setState(() {});
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _inputCantidad() {
    return Container(
      width: 40.0,
      height: 30.0,
      foregroundDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: Colors.blueGrey,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(5.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              style: TextStyle(
                fontSize: 12.0,
              ),
              controller: _controller,
              keyboardType: TextInputType.numberWithOptions(
                decimal: false,
                signed: true,
              ),
              inputFormatters: <TextInputFormatter>[
                WhitelistingTextInputFormatter.digitsOnly
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(0.0),
            height: 25.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 0.5,
                      ),
                    ),
                  ),
                  child: InkWell(
                    child: Icon(
                      Icons.arrow_drop_up,
                      size: 10.0,
                    ),
                    onTap: () {
                      int currentValue = int.parse(_controller.text);
                      setState(() {
                        currentValue++;
                        _controller.text =
                            (currentValue).toString(); // incrementing value
                      });
                    },
                  ),
                ),
                InkWell(
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 10.0,
                  ),
                  onTap: () {
                    int currentValue = int.parse(_controller.text);
                    setState(() {
                      currentValue--;
                      _controller.text = (currentValue > 0 ? currentValue : 0)
                          .toString(); // decrementing value
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _recortarTexto(String texto) {
    String nuevoTexto;
    if (texto.length > 75) {
      nuevoTexto = texto.substring(0, 75) + '...';
      return nuevoTexto;
    }
    return texto;
  }
}
