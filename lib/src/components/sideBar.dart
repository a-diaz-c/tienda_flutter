import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final String titulo;
  final List contenido;

  const SideBar({Key key, @required this.titulo, @required this.contenido})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "$titulo",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 10.0),
          ..._crearElementos(),
          /*SizedBox(height: 10.0),
          InkWell(
            child: Text("Ver más..."),
            onTap: () {},
          )*/
        ],
      ),
    );
  }

  List<Widget> _crearElementos() {
    List<Widget> elementos = [];

    for (var item in contenido) {
      elementos.add(Row(
        children: [
          Text(
            item,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ));
    }

    return elementos;
  }
}
