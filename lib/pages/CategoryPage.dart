import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rest/core/MyStore.dart';
import 'package:rest/models/restaurantItemsModel.dart';
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

  int _selectedIndex = 0;
  final LoadJson _loadJson = LoadJson();

  @override
  initState() {
    loadData();
    super.initState();
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  returnWidget(int _selectedIndex) {
    switch (_selectedIndex) {
      case 0:
        return restorentItemList == null
            ? const CircularProgressIndicator().centered()
            : CategoryPageList(listItems: restorentItemList).p4();

      case 1:
        return Text(
          'Index 1: Setting',
          style: optionStyle,
        );
    }
  }

  // static final List<Widget> _widgetOption = <Widget>[
  //   Column(
  //     children: [
  //       Container(
  //         child: restorentItemList == null
  //             ? const CircularProgressIndicator().centered()
  //             : CategoryPageList(listItems: restorentItemList).p4(),
  //       ),
  //       const Text(
  //         'Index 1: Setting',
  //         style: optionStyle,
  //       ),
  //       const Text(
  //         'Index 2: Users',
  //         style: optionStyle,
  //       ),
  //     ],
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: returnWidget(_selectedIndex),
        drawer: const Drawer(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.cyan,
          backgroundColor: Vx.randomColor,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
                backgroundColor: Colors.deepOrange),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: "Cart",
                backgroundColor: Vx.green500),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: "Profile",
                backgroundColor: Vx.yellow500)
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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
