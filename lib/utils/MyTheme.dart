import 'package:flutter/material.dart';

class MyTheme {
  static lightTheme() {
    return ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black),
          centerTitle: true,
        ));
  }
}
