import 'package:flutter/material.dart';
import 'package:reservafacil/app/page/menusPage.dart';
import 'package:reservafacil/app/page/selectedMenuPage.dart';
import 'package:reservafacil/routes.dart';

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
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        ),
        initialRoute: '/',
        routes: routes,
        onGenerateRoute: (settings) {
          if (settings.name == '/menu') {
            return MaterialPageRoute(
              builder: (context) => MyMenusPage(),
            );
          } else if (settings.name!.startsWith('/menu/')) {
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
