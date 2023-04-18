import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rest/controller/loadSubItem.dart';
import 'package:rest/core/MyStore.dart';
import 'package:rest/models/categorySubItemsModel.dart';
import 'package:rest/utils/dimension.dart';
import 'package:velocity_x/velocity_x.dart';

class SubItemListPage extends StatefulWidget {
  const SubItemListPage({Key? key}) : super(key: key);

  @override
  State<SubItemListPage> createState() => _SubItemListPageState();
}

class _SubItemListPageState extends State<SubItemListPage> {
  List<RestaurantItemsList> outputList = <RestaurantItemsList>[];

  // var outputList;
  var data;

  LoadSubItemController loadSubItemController =
      Get.put(LoadSubItemController());

  @override
  void initState() {
    loadSubItem();
    data = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: outputList.isEmpty
          ? const CircularProgressIndicator()
          : ListView.builder(
              itemCount: outputList.length,
              itemBuilder: (context, index) {
                return CatelogSubItem(catelog: outputList[index]);
              }),
    );
  }

  void loadSubItem() {
    var result = loadSubItemController.getSubItemList(context);
    result.then((value) {
      filterData(value);
    });
  }

  filterData(List<RestaurantItemsList> inputList) {
    outputList.addAll(inputList
        .where((element) => element.restaurantItemsId == data[0])
        .toList());
    setState(() {});
  }
}

class CatelogSubItem extends StatelessWidget {
  final RestaurantItemsList catelog;
   CatelogSubItem({Key? key, required this.catelog}) : super(key: key);
  var myStore = Get.find<MyStore>();
    // MyStore myStore = Get.put(MyStore());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
      },
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Hero(
                tag: Key(catelog.id.toString()),
                child: CircleAvatar(
                  backgroundColor: Vx.white,
                  child: Image.network(catelog.image, fit: BoxFit.contain)
                      .h16(context)
                      .w16(context)
                      .p(10),
                )),
            Column(
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
                // MyRatingBar(rating: catelog.id).objectCenterRight().px16()
              ],
            ),
            ElevatedButton(
                //need to be redraw
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey),
                    shape: MaterialStateProperty.all(StadiumBorder())),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(CupertinoIcons.minus).onTap(() {
                      print("minus");
                      myStore.removeItem(catelog);
                    }),
                    SizedBox(width: MyDimensions.defaultPadding),
                    Obx(() => "${myStore.cartItem.length}".text.make()),
                    SizedBox(width: MyDimensions.defaultPadding),
                    Icon(CupertinoIcons.add).onTap(() {
                      myStore.addItem(catelog);
                    }),
                  ],
                )).p(16)
          ],
        ).cornerRadius(150).color(context.cardColor).p16(),
      ),
    );
  }
}
