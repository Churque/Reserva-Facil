import 'package:flutter/material.dart';
import 'package:reserva_facil/app/page/menusPage.dart';
import 'package:reserva_facil/app/page/selectedMenuPage.dart';
import 'package:reserva_facil/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "asdasd",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 0, 55, 110)),
        ),
        initialRoute: '/',
        routes: routes,
        onGenerateRoute: (settings) {
          if (settings.name!.startsWith('/menu/')) {
            final List<String> pathComponents = settings.name!.split('/');
            if (pathComponents.length == 3) {
              final int menuId = int.tryParse(pathComponents[2]) ?? -1;
              if (menuId != -1) {
                return MaterialPageRoute(
                  builder: (context) => MySelectedMenu(menuId: menuId),
                );
              }
            }
          }
        });
  }
}
