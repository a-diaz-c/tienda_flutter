import 'package:flutter/material.dart';

Widget navBar() {
  return Container(
    color: Colors.blue,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _textoNavBar(),
        _fieldBuscar(),
        _menu(),
      ],
    ),
  );
}

Widget _textoNavBar() {
  return Container(
    padding: EdgeInsets.only(top: 10.0),
    child: Text(
      "¿Tienes alguna duda? Llámanos  722 212 3737?",
      style: TextStyle(fontSize: 10.0, color: Colors.white),
    ),
  );
}

Widget _fieldBuscar() {
  return Container(
    padding: EdgeInsets.all(1.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: Text(
            "Nombre de la tienda",
            style: TextStyle(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20.0,
        ),
        Flexible(
          child: Container(
            width: 400.0,
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
        ),
        _carrito(),
      ],
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
          child: _cemento(),
          padding: EdgeInsets.all(10.0),
        ),
        Container(
          child: _aceros(),
          padding: EdgeInsets.all(10.0),
        ),
        Container(
          child: _otrosMateriales(),
          padding: EdgeInsets.all(10.0),
        ),
        Container(
          child: _acabado(),
          padding: EdgeInsets.all(10.0),
        )
      ],
    ),
  );
}

Widget _cemento() => PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "Cemento Blaco",
          child: Text("Cemento Blanco"),
        ),
        PopupMenuItem(
          value: "Cemento Extra",
          child: Text("Cemento Extra"),
        )
      ],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          "Cementos",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      offset: Offset(0, 100),
      tooltip: 'Mostrar Menu',
    );

Widget _aceros() => PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "Cemento Blaco",
          child: Text("Cemento Blanco"),
        ),
        PopupMenuItem(
          value: "Cemento Extra",
          child: Text("Cemento Extra"),
        )
      ],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          "Aceros",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      offset: Offset(0, 100),
      tooltip: 'Mostrar Menu',
    );

Widget _otrosMateriales() => PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "Cemento Blaco",
          child: Text("Cemento Blanco"),
        ),
        PopupMenuItem(
          value: "Cemento Extra",
          child: Text("Cemento Extra"),
        )
      ],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          "Otros Materiales",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      offset: Offset(0, 100),
      tooltip: 'Mostrar Menu',
    );

Widget _acabado() => PopupMenuButton(
      itemBuilder: (context) => [
        PopupMenuItem(
          value: "Cemento Blaco",
          child: Text("Cemento Blanco"),
        ),
        PopupMenuItem(
          value: "Cemento Extra",
          child: Text("Cemento Extra"),
        )
      ],
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Text(
          "Acabados",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      offset: Offset(0, 100),
      tooltip: 'Mostrar Menu',
    );
