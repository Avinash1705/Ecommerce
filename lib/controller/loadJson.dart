import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:rest/models/restaurantItemsModel.dart';
import 'package:velocity_x/velocity_x.dart';

class LoadJson {

  Future<List<RestaurantItem>> loadCatalogList(BuildContext context) async {
    late RestaurantItemsModel restaurantItemsModel;
    try {
      //json
      var responce = await rootBundle.loadString("/files/categoryProduct.json");
      //object
      restaurantItemsModel = restaurantItemsModelFromJson(responce);
    } catch (exception) {
      // Future.delayed(Duration(seconds: 3));
      VxToast.show(context, msg: exception.toString());
    }
    return restaurantItemsModel.restaurantItems;
  }
}
