import 'package:fluro/fluro.Dart';
import 'package:flutter/material.Dart';
import 'package:tienda/src/pages/home_page.dart';
import 'package:tienda/src/pages/producto_page.dart';

class FluroRouter {
  static Router router = Router();
  static Handler _storyhandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          ProductoPage(id: params['id'][0]));
  static Handler _homehandler = Handler(
      handlerFunc: (BuildContext context, Map<String, dynamic> params) =>
          HomePage(
            familia: params['categoria'][0],
          ));
  static void setupRouter() {
    router.define(
      '/:categoria',
      handler: _homehandler,
    );
    router.define(
      '/producto/:id',
      handler: _storyhandler,
    );
  }
}
