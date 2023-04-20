// To parse this JSON data, do
//
//     final CartModelTest = CartModelTestFromJson(jsonString);

import 'package:rest/models/categorySubItemsModel.dart';

class CartModelTest {

  CartModelTest({required this.count, required this.restaurantItemsList});

  final int count;
  final RestaurantItemsList restaurantItemsList;

}
