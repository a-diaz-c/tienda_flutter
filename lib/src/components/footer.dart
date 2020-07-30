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
              InkWell(
                child: Text("Cemento"),
                onTap: () {},
              ),
              InkWell(
                child: Text("Acero"),
                onTap: () {},
              ),
              InkWell(
                child: Text("Otro Materiales"),
                onTap: () {},
              ),
              InkWell(
                child: Text("Acabados"),
                onTap: () {},
              ),
            ],
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(child: Text("Plomería")),
              InkWell(child: Text("Material Eléctrico")),
              InkWell(child: Text("Herramientas")),
              InkWell(child: Text("Ferretería")),
              InkWell(child: Text("Promociones"))
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
