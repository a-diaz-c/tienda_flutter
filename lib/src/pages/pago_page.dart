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
                Text('direccion'),
                Text("This is notification Tab View")
              ][_tabController.index],
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _productos() {
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
