import 'package:flutter/material.dart';

class TBottomNavigationTheme {
  static final NavigationBarThemeData lightBottomNavigationTheme = NavigationBarThemeData(
    backgroundColor: Colors.white,
    height: 50.0,
    indicatorColor: Colors.black,
    labelTextStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    ),
    iconTheme: MaterialStateProperty.all(
      const IconThemeData(
        color: Colors.grey,
        size: 24,
      ),
    ),

  );
}