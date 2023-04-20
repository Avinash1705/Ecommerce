//@dart =2.9
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest/core/MyStore.dart';
import 'package:rest/pages/CategoryPage.dart';
import 'package:rest/pages/DetailPage.dart';
import 'package:rest/pages/SubItemListPage.dart';
import 'package:rest/routes/MyRoutes.dart';
import 'package:rest/utils/MyTheme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);
  var myStore = Get.put(MyStore());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: MyTheme.lightTheme(),
      initialRoute: MyRoutes.categoryRoute,
      getPages: [
        GetPage(name: MyRoutes.categoryRoute, page: () => CategoryPage()),
        GetPage(name: MyRoutes.subItemRoute, page: () => SubItemListPage()),
        // GetPage(name: MyRoutes.detailRoute, page: () => DetailPage()),
      ],
    );
  }
}
