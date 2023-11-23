import 'package:flutter/material.dart';
import 'package:reservafacil/app/page/menusPage.dart';
import 'package:reservafacil/app/page/selectedMenuPage.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const MyMenusPage(),
  // Aca cambiar tipo asi el 1 por el id del menu
  '/menu/1/': (BuildContext context) => const MySelectedMenu(),
};
