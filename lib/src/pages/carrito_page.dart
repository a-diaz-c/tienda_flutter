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
                double anchoTabla = MediaQuery.of(context).size.width * 0.70;
                if (MediaQuery.of(context).size.width > 900) {
                  return Center(
                      child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: _tablaProductos(anchoTabla),
                  ));
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

  Widget _tablaProductos(double ancho) {
    return Table(
      columnWidths: {
        0: FixedColumnWidth(ancho * 0.05),
        1: FixedColumnWidth(ancho * 0.10),
        2: FixedColumnWidth(ancho * 0.30),
        3: FixedColumnWidth(ancho * 0.20),
        4: FixedColumnWidth(ancho * 0.10),
        5: FixedColumnWidth(ancho * 0.15),
      },
      border: TableBorder.all(),
      children: [
        _cabeceraTabla(),
        ..._cuerpoTabla(),
      ],
    );
  }

  TableRow _cabeceraTabla() {
    return TableRow(
      children: [
        Text(""),
        Text(""),
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Producto",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Precio",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Cantidad",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          child: Text(
            "Subtotal",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  List<TableRow> _cuerpoTabla() {
    return [
      _filaTabla(
          '', 'Truper, Clavo Negro 2" Para Concreto, Kilogramos', 36.00, 1),
      _filaTabla(
          '', 'Truper, Clavo Negro 2" Para Concreto, Kilogramos', 36.00, 1),
    ];
  }

  TableRow _filaTabla(
      String imagen, String producto, double precio, int cantidad) {
    return TableRow(
      children: [
        Text("X"),
        Text(""),
        Text(producto),
        Text('\$ ' + precio.toString()),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 30,
              padding: EdgeInsets.all(2.5),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 5.0,
                  ),
                  counterText: '',
                ),
                style: TextStyle(
                  fontSize: 12.0,
                ),
                inputFormatters: [
                  WhitelistingTextInputFormatter.digitsOnly,
                ],
              ),
            ),
          ],
        ),
        Text("36.00"),
      ],
    );
  }
}
