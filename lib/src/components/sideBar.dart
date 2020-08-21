import 'package:flutter/material.dart';

class SideBar extends StatefulWidget {
  final String titulo;
  final List contenido;

  const SideBar({Key key, this.titulo, this.contenido}) : super(key: key);
  @override
  _SideBarState createState() => _SideBarState(this.titulo, this.contenido);
}

class _SideBarState extends State<SideBar> {
  final String titulo;
  final List contenido;
  List<bool> _checkbox;

  _SideBarState(this.titulo, this.contenido) {
    _checkbox = List.filled(this.contenido.length, false);
  }
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

    for (var i = 0; i < contenido.length; i++) {
      elementos.add(Container(
        padding: EdgeInsets.all(0),
        height: 25.0,
        child: Row(
          children: [
            Checkbox(
                value: _checkbox[i],
                onChanged: (bool value) {
                  setState(() {
                    _checkbox[i] = value;
                  });
                }),
            InkWell(
              child: Text(
                contenido[i],
                style: TextStyle(color: Colors.grey[800]),
              ),
              onTap: () {
                _checkbox[i] = _checkbox[i] == true ? false : true;

                setState(() {});
              },
            )
          ],
        ),
      ));
    }

    return elementos;
  }
}
