import 'dart:js';

import 'package:flutter/material.dart';

Widget navBar(BuildContext context) {
  return LayoutBuilder(builder: (context, constraints) {
    double anchoPantalla = MediaQuery.of(context).size.width;
    if (anchoPantalla > 900) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textoNavBar(),
            _fieldBuscar(anchoPantalla, context),
            _menu(),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        color: Colors.blue,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _textoNavBar(),
            Row(
              children: [
                Container(
                  child: Image(
                    image: AssetImage('images/LogotipoPaginaWeb.png'),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                _textField(anchoPantalla),
              ],
            ),
          ],
        ),
      );
    }
  });
}

Widget _textoNavBar() {
  return Container(
    padding: EdgeInsets.only(top: 10.0),
    child: Text(
      "¿Tienes alguna duda? Llámanos  (744) 484.9493",
      style: TextStyle(fontSize: 10.0, color: Colors.white),
    ),
  );
}

Widget _fieldBuscar(double anchoPantalla, BuildContext context) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: InkWell(
            child: Image(
              image: AssetImage('images/LogotipoPaginaWeb.png'),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/');
            },
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        _textField(anchoPantalla),
        _carrito(),
      ],
    ),
  );
}

Widget _textField(double anchoPantalla) {
  double ancho = (anchoPantalla > 900) ? 400 : anchoPantalla * 0.90;
  return Flexible(
    child: Container(
      width: ancho,
      height: 30.0,
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          labelText: 'Buscar Prodcucto',
          floatingLabelBehavior: FloatingLabelBehavior.never,
          fillColor: Colors.white,
          filled: true,
          contentPadding: EdgeInsetsDirectional.only(
              top: 5.0, bottom: 5.0, start: 10.0, end: 10.0),
        ),
      ),
    ),
  );
}

Widget _carrito() {
  return Container(
    child: Row(
      children: [
        IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: null,
        ),
        InkWell(
          child: Row(
            children: [
              Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "0 Artículos",
                    style: TextStyle(fontSize: 10.0, color: Colors.white),
                  ),
                  Text(
                    "\$ 0.00",
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
          onTap: () {},
        )
      ],
    ),
  );
}

Widget _menu() {
  return Container(
    child: Row(
      children: [
        Container(
          child: _itemMenu({
            "Cemento Blaco": "Cemento Blanco",
            "Cemento Extra": "Cemento Extra"
          }, "Cemento"),
          padding: EdgeInsets.all(10.0),
        ),
        Container(
          child: _itemMenu({
            "Alambre y Alambron": "Alambre y Alambron",
            "Castillos": "Castillos",
            "Malla Electrosoldada": "Malla Electrosoldada",
          }, "Aceros"),
          padding: EdgeInsets.all(10.0),
        ),
        Container(
          child: _itemMenu({
            "Cemento Blaco": "Cemento Blanco",
            "Cemento Extra": "Cemento Extra"
          }, "Otro Materiales"),
          padding: EdgeInsets.all(10.0),
        ),
        Container(
          child: _itemMenu({
            "Cemento Blaco": "Cemento Blanco",
            "Cemento Extra": "Cemento Extra"
          }, "Acabados"),
          padding: EdgeInsets.all(10.0),
        ),
      ],
    ),
  );
}

Widget _itemMenu(Map<String, String> datos, String titulo) {
  List<PopupMenuEntry<String>> items = [];

  datos.forEach((key, value) {
    items.add(
      PopupMenuItem(
        value: key,
        child: Text(value),
      ),
    );
  });
  return PopupMenuButton(
    itemBuilder: (context) => [...items],
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        titulo,
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    ),
    offset: Offset(0, 100),
    tooltip: 'Mostrar Menu',
  );
}
