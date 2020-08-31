import 'package:fluro/fluro.Dart' as fluro;
import 'package:flutter/material.Dart';
import 'package:tienda/src/pages/carrito_page.dart';
import 'package:tienda/src/pages/familias_page.dart';
import 'package:tienda/src/pages/home_page.dart';
import 'package:tienda/src/pages/producto_page.dart';

class FluroRouter {
  static fluro.Router router = fluro.Router();
  static fluro.Handler _storyhandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        ProductoPage(id: params['id'][0]),
  );
  static fluro.Handler _homehandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        HomePage(),
  );
  static fluro.Handler _familiahandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
        FamiliaPage(
      familia: params['familia'][0],
    ),
  );
  static fluro.Handler _carritohandler = fluro.Handler(
    handlerFunc: (BuildContext context, Map<String, dynamic> parameters) =>
        CarritoPage(),
  );

  static void setupRouter() {
    router.define(
      '/',
      handler: _homehandler,
    );
    router.define(
      '/producto/:id',
      handler: _storyhandler,
    );
    router.define(
      '/productos/:familia',
      handler: _familiahandler,
    );
    router.define(
      '/carrito',
      handler: _carritohandler,
    );
  }
}
