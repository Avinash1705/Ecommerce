import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rest/models/categorySubItemsModel.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadSubItemController {
  Future<List<RestaurantItemsList>> getSubItemList(BuildContext context) async {
    late CategorySubItemsModel responce;
    try {
      var result =
          await rootBundle.loadString("assets/files/categorySubItems.json");
      responce = categorySubItemsModelFromJson(result) ;
    } catch (execption) {
      VxToast.show(context, msg: execption.toString());
    }
    return responce.restaurantItemsList;
  }
  //
  // var listRestorent = <RestaurantItemsList>[].obs;
  //
  // getList() async {
  //   try {
  //     var result =
  //         await rootBundle.loadString("assets/files/categorySubItems.json");
  //     listRestorent.addAll(categorySubItemsModelFromJson(result));
  //   } catch (execption) {
  //     VxToast.show(context, msg: execption.toString());
  //   }
  // }
}
