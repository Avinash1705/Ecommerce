//@dart =2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest/pages/CategoryPage.dart';
import 'package:rest/pages/SubItemListPage.dart';
import 'package:rest/routes/MyRoutes.dart';
import 'package:rest/utils/MyTheme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: MyRoutes.categoryRoute,
      // routes: {
      //   // "/": (context) => const CategoryPage(),
      //   MyRoutes.categoryRoute: (context) => const CategoryPage(),
      //   MyRoutes.subItemRoute: (context) => const SubItemListPage(),
      // },
      getPages: [
        GetPage(name: MyRoutes.categoryRoute, page: () => CategoryPage()),
        GetPage(name: MyRoutes.subItemRoute, page: () => SubItemListPage()),
      ],
    );
  }
}
