import 'package:flutter/material.dart';
import 'package:reserva_facil/app/page/historial_page.dart';
import 'package:reserva_facil/app/page/menusPage.dart';
import 'package:reserva_facil/app/page/ScannerQR.dart';
import 'package:reserva_facil/app/page/qrpage.dart';
import 'package:reserva_facil/app/page/selectedMenuPage.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const MyMenusPage(),
  '/codigoqr': (BuildContext context) {
    final qrData = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    return MyQRPage(qrData: qrData);
  },
  '/scanner': (BuildContext context) => const ScannerQRPage(),
  '/menu': (BuildContext context) {
    final int menuId = ModalRoute.of(context)!.settings.arguments as int;
    return MySelectedMenu(menuId: menuId);
  },
  '/historial': (BuildContext context) => const MyHistorialPage(),
};
