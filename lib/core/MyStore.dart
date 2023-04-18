

import 'package:get/get.dart';
import 'package:rest/models/categorySubItemsModel.dart';

class MyStore extends GetxController{

  var cartItem = <RestaurantItemsList>[].obs ;
  get cartItemLiveData => cartItem ;

  addItem(item) {
  cartItem.add(item);
  print("added ${cartItem}");
  }

  removeItem(item) {
  cartItem.remove(item);
  print("removed ${cartItem}");
  }
}