//@dart =2.9
import 'package:flutter/material.dart';
import 'package:rest/pages/CategoryPage.dart';
import 'package:rest/routes/MyRoutes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      initialRoute: MyRoutes.categoryRoute,
      routes: {
        // "/": (context) => const CategoryPage(),
        MyRoutes.categoryRoute: (context) => const CategoryPage(),
      },
    );
  }
}
