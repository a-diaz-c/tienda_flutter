import 'package:flutter/material.dart';
import 'package:tienda/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRouter() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
  };
}
