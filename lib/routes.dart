import 'package:flutter/material.dart';
import 'package:reserva_facil/app/page/home_page_widget.dart';
import 'package:reserva_facil/app/page/menusPage.dart';
import 'package:reserva_facil/app/page/misordenes_widget.dart';
import 'package:reserva_facil/app/page/selectedMenuPage.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const MyMenusPage(),

  // Aca cambiar tipo asi el 1 por el id del menu
  '/menu/:id/': (context) {
    print('Entrando a la ruta /menu/:id');
    // Obtén el ID del menú de la ruta
    final int menuId =
        int.parse(ModalRoute.of(context)!.settings.name!.split('/').last);
    print('ID del menú: $menuId');
    return MySelectedMenu(menuId: menuId);
  },
  //'/misordenes': (BuildContext context) => const MisordenesWidget()
};
