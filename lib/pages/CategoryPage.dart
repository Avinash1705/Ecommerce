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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: restorentItemList == null
            ? const CircularProgressIndicator().centered()
            : CategoryPageList(listItems: restorentItemList).p4(),
        drawer: const Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile")
          ],
        ),
      ),
    );
  }

  loadData() {
    _loadJson.loadCatalogList(context).then((value) {
      setState(() {
        restorentItemList = value;
      });
    });
  }
}
