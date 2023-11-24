import 'package:flutter/material.dart';
import 'package:reserva_facil/app/page/home_page_widget.dart';
import 'package:reserva_facil/app/page/misordenes_widget.dart';
import 'package:reserva_facil/app/page/selectedMenuPage.dart';

final Map<String, WidgetBuilder> routes = {
  '/home': (BuildContext context) => const HomePageWidget(),
  // Aca cambiar tipo asi el 1 por el id del menu
  '/menu/1/': (BuildContext context) => const MySelectedMenu(),
  '/misordenes': (BuildContext context) => const MisordenesWidget()
};
