// To parse this JSON data, do
//
//     final categorySubItemsModel = categorySubItemsModelFromJson(jsonString);

import 'dart:convert';

CategorySubItemsModel categorySubItemsModelFromJson(String str) => CategorySubItemsModel.fromJson(json.decode(str));

String categorySubItemsModelToJson(CategorySubItemsModel data) => json.encode(data.toJson());

class CategorySubItemsModel {
  CategorySubItemsModel({
    required this.restaurantItemsList,
  });

  final List<RestaurantItemsList> restaurantItemsList;

  factory CategorySubItemsModel.fromJson(Map<String, dynamic> json) => CategorySubItemsModel(
    restaurantItemsList: List<RestaurantItemsList>.from(json["restaurantItemsList"].map((x) => RestaurantItemsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurantItemsList": List<dynamic>.from(restaurantItemsList.map((x) => x.toJson())),
  };
}

class RestaurantItemsList {
  RestaurantItemsList({
    required this.id,
    required this.restaurantItemsId,
    required this.name,
    required this.desc,
    required this.price,
    required this.color,
    required this.image,
  });

  final int id;
  final int restaurantItemsId;
  final String name;
  final String desc;
  final int price;
  final String color;
  final String image;

  factory RestaurantItemsList.fromJson(Map<String, dynamic> json) => RestaurantItemsList(
    id: json["id"],
    restaurantItemsId: json["restaurantItemsId"],
    name: json["name"],
    desc: json["desc"],
    price: json["price"],
    color: json["color"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "restaurantItemsId": restaurantItemsId,
    "name": name,
    "desc": desc,
    "price": price,
    "color": color,
    "image": image,
  };
}
