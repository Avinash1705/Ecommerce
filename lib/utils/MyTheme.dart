import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static lightTheme() {
    return ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white70,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
          centerTitle: true,
        )
    );
  }

  static Color creamColor = const Color(0xFFF5f5f5);
  // static Color creamColorDark = Vx.gray900;
  // static Color darkBluish = const Color(0xFF403b58);

}
