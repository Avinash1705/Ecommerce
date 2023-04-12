import 'package:flutter/material.dart';
import 'package:rest/models/restaurantItemsModel.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:developer';

class CategoryPageList extends StatelessWidget {
  final List<RestaurantItem> listItems;

  const CategoryPageList({Key? key, required this.listItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listItems.length,
        itemBuilder: (context, position) {
          return ListTile(
            leading: CircleAvatar(
              child:Image.network(listItems[position].image,fit: BoxFit.cover),
            ),
            title: listItems[position].name.text.make(),
            trailing: listItems[position].desc.text.make(),
          );
        });
  }
}
