import 'package:flutter/material.dart';
import 'package:reserva_facil/app/page/menusPage.dart';
import 'package:reserva_facil/app/page/ScannerQR.dart';
import 'package:reserva_facil/app/page/qrpage.dart';
import 'package:reserva_facil/app/page/selectedMenuPage.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => const MyMenusPage(),
  //'/codigoqr': (BuildContext context) => const MyQRPage(),
  '/codigoqr': (BuildContext context) {
    final qrData = ModalRoute.of(context)?.settings.arguments as String? ?? '';
    return MyQRPage(qrData: qrData);
  },

  '/scanner': (BuildContext context) => const Second(),

  '/menu/:id/': (context) {
    final int menuId =
        int.parse(ModalRoute.of(context)!.settings.name!.split('/').last);

    return MySelectedMenu(menuId: menuId);
  },
  //'/misordenes': (BuildContext context) => const MisordenesWidget()
};
