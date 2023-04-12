import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rest/models/restaurantItemsModel.dart';
import 'package:rest/widget/ratingBar.dart';
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
        itemBuilder: (context, position) =>
            CatelogItem(catelog: listItems[position]));
  }
}

class CatelogItem extends StatelessWidget {
  final RestaurantItem catelog;

  const CatelogItem({Key? key, required this.catelog})
      : assert(catelog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Hero(
            tag: Key(catelog.id.toString()),
            child:
                Image.network(catelog.image).h16(context).w16(context).p(10)),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            catelog.name.text.lg.color(context.accentColor).medium.bold.make(),
            catelog.desc.text.lg.textStyle(context.captionStyle).sm.bold.make(),
            10.heightBox,
            MyRatingBar(rating: catelog.quality).objectCenterRight().px16()
          ],
        ))
      ],
    ).cornerRadius(150).color(context.cardColor).p16();
  }
}
