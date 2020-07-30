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
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Nombre de la tienda",
          style: TextStyle(color: Colors.white),
        ),
        _categorias(),
        _soporte(),
        _servicioCliente(),
      ],
    ),
  );
}

Widget _categorias() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Categorías",
        style: TextStyle(
          fontSize: 20.0,
          color: Colors.white,
        ),
      ),
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Cemento"),
              Text("Acero"),
              Text("Otro Materiales"),
              Text("Acabados"),
            ],
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Plomería"),
              Text("Material Eléctrico"),
              Text("Herramientas"),
              Text("Ferretería"),
              Text("Promociones")
            ],
          )
        ],
      )
    ],
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
      Text("Términos y condiciones de uso"),
      Text("Tickets de Soporte"),
      Text("Preguntas frecuentes"),
      Text("Políticas de devoluciones"),
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
        ),
        child: Row(
          children: [
            Icon(Icons.phone),
            Text("01 800 234 88 90"),
          ],
        ),
        onPressed: () {},
      ),
      Text(
        "compraenlinea@construrama.com",
        style: TextStyle(fontSize: 12.0),
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
      "Copyright © 2020, CEMEX International Holding AG. Derechos Reservados | Copyright © 2020, de esta versión para México CEMEX S.A.B. de C.V. Derechos Reservados",
      style: TextStyle(fontSize: 12.0, color: Colors.white),
    ),
  );
}
