import 'package:flutter/material.dart';

import 'package:draggable_scrollbar/draggable_scrollbar.dart';
import 'package:tienda/src/components/footer.dart';
import 'package:tienda/src/components/navbar.dart';
import 'package:tienda/src/providers/productos_providers.dart';

class PagoPage extends StatefulWidget {
  @override
  _PagoPageState createState() => _PagoPageState();
}

class _PagoPageState extends State<PagoPage>
    with SingleTickerProviderStateMixin {
  ScrollController _rrectController = ScrollController();
  TabController _tabController;
  ProductosProviders productosProviders = ProductosProviders();
  double _subTotal = 0;
  List datos = [];

  Map<String, dynamic> envio = {
    'nombre': 'Hector',
    'apelliod': 'Nunez',
    'empresa': 'Kingo System',
    'sexo': 'H',
    'telefono': '7444849493',
    'calle': 'Av. Costera Miguel Aleman',
    'numExt': '1252',
    'numInt': '18',
    'referencia': 'En la torre de Acapulco',
    'colonia': 'Club Deportivo',
    'codigoPostal': '39690',
    'ciudad': 'Acapulco',
    'estado': 'Guerrero',
    'pais': 'México',
  };

  Map<String, dynamic> factura = {
    'nombre': 'Kingo Systems SA de CV',
    'rfc': 'KYS010331243',
    'email': '',
    'usoDeCEDI': 'G03 - Gastos en general',
  };

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
    _cargarCarrito();
  }

  _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {});
    }
  }

  _cargarCarrito() {
    datos = productosProviders.getProductosCarrito();
    if (datos == null) datos = [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DraggableScrollbar.rrect(
        alwaysVisibleScrollThumb: true,
        controller: _rrectController,
        backgroundColor: Colors.grey[300],
        child: ListView(
          controller: _rrectController,
          children: [
            Navbar(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _tabs(MediaQuery.of(context).size.width * 0.65),
                Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Card(
                    color: Colors.grey[200],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Carito de compras',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                        const Divider(
                          color: Colors.black,
                          height: 1,
                          thickness: 1,
                        ),
                        ..._productos(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Subtotal \$ $_subTotal'),
                            Text('Costo Total \$'),
                            const Divider(
                              color: Colors.black,
                              height: 1,
                              thickness: 1,
                            ),
                            Text('Precio total \$'),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            footer(),
          ],
        ),
      ),
    );
  }

  Widget _tabs(double ancho) {
    return Center(
      child: Container(
        width: ancho,
        padding: EdgeInsets.only(bottom: 20.0),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              height: 40.0,
              child: TabBar(
                tabs: [
                  Tab(
                    child: Container(
                      height: 25,
                      child: Text(
                        "Elegir Dirección",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      height: 25,
                      child: Text(
                        "Envio y Pago",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ],
                controller: _tabController,
                indicatorColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.tab,
              ),
            ),
            Center(
              child: [
                _direcciones(ancho),
                Text("This is notification Tab View")
              ][_tabController.index],
            ),
          ],
        ),
      ),
    );
  }

  Widget _direcciones(double ancho) {
    return Column(
      children: [
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Text(
                  'Direccion de envio',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: Text('Verifique sus direccion de envio'),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 250,
                    width: ancho * 0.70,
                    child: Card(
                      child: Column(
                        children: [
                          ListTile(
                            title: Text(envio['nombre']),
                            subtitle: Text(envio['empresa']),
                          ),
                          Text(envio['calle'] +
                              ' ' +
                              envio['numExt'] +
                              ' ' +
                              envio['numInt']),
                          Text(envio['referencia']),
                          Text(envio['colonia']),
                          Text(envio['codigoPostal'] + ', ' + envio['ciudad']),
                          Text(envio['estado'] + ', ' + envio['pais']),
                          SizedBox(height: 10),
                          Text('Tel, ' + envio['telefono'])
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      RaisedButton(
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            Text('Editar Direccion'),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/direcciones/1');
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                child: Text(
                  'Direccion de facturacion',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text('Verifique sus de facturacion')),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: ancho * 0.70,
                    child: Card(
                      child: Column(
                        children: [
                          Text(
                            'Razon social o nombre',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(factura['nombre']),
                          SizedBox(height: 5),
                          Text(
                            'RFC',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(factura['rfc']),
                          SizedBox(height: 5),
                          Text(
                            'Uso de CFDI',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          Text(factura['usoDeCEDI'])
                        ],
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      RaisedButton(
                        child: Row(
                          children: [
                            Icon(Icons.edit),
                            Text('Editar Direccion'),
                          ],
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, '/direcciones/2');
                        },
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> _productos() {
    _subTotal = 0;
    List<Widget> lista = [];
    datos.forEach((element) {
      _subTotal += element['precio'] * element['cantidad'];
      lista.add(
        Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 3),
          child: Text(
            element['nombre'],
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
        ),
      );
    });

    return lista;
  }
}
