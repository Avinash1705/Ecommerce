import 'package:get/get.dart';
import 'package:rest/models/cartModelTest.dart';
import 'package:rest/models/categorySubItemsModel.dart';

class MyStore extends GetxController {
  Map resp = {};

  var cartItem = <RestaurantItemsList>[].obs;
  List<CartModelTest> weightData = [];

  get cartLength => cartItem.length;

  addItem(item) {
    cartItem.add(item);
  }

  removeItem(item) {
    cartItem.remove(item);
  }

  checkIfItemExits(RestaurantItemsList element) {
    return cartItem.length;
  }

  // countsItems(RestaurantItemsList item) {
  //   for (var items in cartItem) {
  //     int count = 0;
  //     for (var val in cartItem) {
  //       if (items == val) {
  //         count++;
  //
  //       }
  //       resp[items.name] = count;
  //     }
  //   }
  //   return resp[item.name] == null ? 0 : resp[item.name];
  // }

  countsItems(RestaurantItemsList item) {
    for (var items in cartItem) {
      int count = 0;
      for (var val in cartItem) {
        if (items == val) {
          count++;
        }
        resp[items] = count;
      }
    }
    weightData =
    resp.entries.map((entry) =>
        CartModelTest(count: entry.value, restaurantItemsList: entry.key))
        .toList();
    return resp[item] == null ? 0 : resp[item];
  }
// listCartConversion(){
//   List listCart = [];
//   listCart.addAll(resp.keys.toList()) ;
//   for(int i = 0 ; i <listCart.length;i++){
//     print(listCart[i]);
//   }
}
// countsItems(RestaurantItemsList item){
//   for(int i=0 ;i< cartItem.length;i++){
//     int count =0;
//     for(int j=0 ;j<cartItem.length;j++){
//       if(cartItem[i] == cartItem[j]){
//         count ++;
//       }
//     }
//     //count save
//     resp.add(cartItem[i]);
//   }
//   print(resp);
//   return resp.isEmpty ? 0 : resp[];
// }

