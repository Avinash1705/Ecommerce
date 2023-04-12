import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rest/widget/CategoryPageList.dart';
import 'package:rest/controller/loadJson.dart';
import 'package:velocity_x/velocity_x.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var restorentItemList;
  final LoadJson _loadJson = LoadJson();

  @override
  initState() {
    loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: restorentItemList == null
          ? const CircularProgressIndicator().centered()
          : CategoryPageList(listItems: restorentItemList),
    );
  }

  loadData()  {
     _loadJson.loadCatalogList(context).then((value) {
      restorentItemList = value;
    });
  }
}
