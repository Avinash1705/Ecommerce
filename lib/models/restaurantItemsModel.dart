// To parse this JSON data, do
//
//     final restaurantItemsModel = restaurantItemsModelFromJson(jsonString);

import 'dart:convert';

RestaurantItemsModel restaurantItemsModelFromJson(String str) => RestaurantItemsModel.fromJson(json.decode(str));

String restaurantItemsModelToJson(RestaurantItemsModel data) => json.encode(data.toJson());

class RestaurantItemsModel {
  RestaurantItemsModel({
    required this.restaurantItems,
  });

  final List<RestaurantItem> restaurantItems;

  factory RestaurantItemsModel.fromJson(Map<String, dynamic> json) => RestaurantItemsModel(
    restaurantItems: List<RestaurantItem>.from(json["restaurantItems"].map((x) => RestaurantItem.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurantItems": List<dynamic>.from(restaurantItems.map((x) => x.toJson())),
  };
}

class RestaurantItem {
  RestaurantItem({
    required this.id,
    required this.name,
    required this.desc,
    required this.color,
    required this.image,
  });

  final int id;
  final String name;
  final String desc;
  final String color;
  final String image;

  factory RestaurantItem.fromJson(Map<String, dynamic> json) => RestaurantItem(
    id: json["id"],
    name: json["name"],
    desc: json["desc"],
    color: json["color"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "color": color,
    "image": image,
  };
}
