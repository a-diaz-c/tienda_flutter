import 'package:flutter/material.dart';

Widget footer() {
  return Container(
    padding: EdgeInsets.only(top: 20.0),
    color: Colors.blue,
    child: Column(
      children: [
        _parteUno(),
        SizedBox(height: 15),
        _parteTres(),
      ],
    ),
  );
}

Widget _parteUno() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image(image: AssetImage('images/LogotipoPaginaWeb.png')),
        _soporte(),
        _servicioCliente(),
      ],
    ),
  );
}

Widget _soporte() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Soporte",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      SizedBox(height: 10.0),
      InkWell(
        child: Text("Términos y condiciones de uso"),
        onTap: () {},
      ),
      SizedBox(height: 5.0),
      InkWell(
        child: Text("Tickets de Soporte"),
        onTap: () {},
      ),
      SizedBox(height: 5.0),
      InkWell(
        child: Text("Preguntas frecuentes"),
        onTap: () {},
      ),
      SizedBox(height: 5.0),
      InkWell(
        child: Text("Políticas de devoluciones"),
        onTap: () {},
      ),
    ],
  );
}

Widget _servicioCliente() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Servicio al cliente",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      RaisedButton(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
            side: BorderSide(color: Colors.white)),
        child: Row(
          children: [
            Icon(
              Icons.phone,
              color: Colors.white,
            ),
            Text(
              "(744) 484.9493",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        onPressed: () {},
        color: Colors.blue,
      ),
      Text(
        "info@kingo.com.mx",
        style: TextStyle(fontSize: 12.0, color: Colors.white),
      )
    ],
  );
}

Widget _parteDos() {
  return Container(
    child: Row(
      children: [
        InkWell(
          child: Row(
            children: [
              Icon(Icons.payment),
              SizedBox(width: 5.0),
              Text(
                "Promociones",
                style: TextStyle(
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
          onTap: () {},
        ),
        Row(
          children: [
            Icon(Icons.payment),
            SizedBox(width: 5.0),
            Text(
              "Centro de Ayuda",
              style: TextStyle(
                color: Colors.white,
                decoration: TextDecoration.underline,
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget _parteTres() {
  return Container(
    padding: EdgeInsets.all(20.0),
    child: Text(
      "Copyright © 2020 Kingo Systems S.A. de C.V.",
      style: TextStyle(fontSize: 12.0, color: Colors.white),
    ),
  );
}
