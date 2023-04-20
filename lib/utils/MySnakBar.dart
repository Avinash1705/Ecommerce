
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MySnakBar {
  static void snakBarFn(context,str) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: "$str".text.xl.make(),
    ));
  }
}