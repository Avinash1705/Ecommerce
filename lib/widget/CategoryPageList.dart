import 'package:flutter/material.dart';
import 'package:rest/models/restaurantItemsModel.dart';
import 'package:rest/widget/ratingBar.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:rest/pages/SubItemListPage.dart';


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
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return
      InkWell(
        onTap: (){
          Get.to(const SubItemListPage(),transition: Transition.downToUp,arguments: [
          catelog.id
          ]);
        },
        child: Container(
          child: Row(
            children: [
              Hero(
                  tag: Key(catelog.id.toString()),
                  child: CircleAvatar(
                    backgroundColor: Vx.white,
                    child:
                    Image.network(catelog.image, fit: BoxFit.contain)
                        .h16(context)
                        .w16(context)
                        .p(10),
                  )),
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      catelog.name.text.lg
                          .color(context.accentColor)
                          .medium
                          .bold
                          .make(),
                      catelog.desc.text.lg
                          .textStyle(context.captionStyle)
                          .sm
                          .bold
                          .make(),
                      10.heightBox,
                      MyRatingBar(rating: catelog.quality)
                          .objectCenterRight()
                          .px16()
                    ],
                  ))
            ],
          ).cornerRadius(150).color(context.cardColor).p16(),
        ),
      );
  }
}
