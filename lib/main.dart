import 'package:flutter/material.dart';
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
      //home: MainScreen()
      initialRoute: '/',
      routes: routes,
    );
  }
}
