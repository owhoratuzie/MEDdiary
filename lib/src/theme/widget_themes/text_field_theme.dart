import 'package:flutter/material.dart';
import 'package:med_diary/src/theme/colors/colors.dart';



class TTextFormFieldTheme {
  TTextFormFieldTheme._();



  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
      hintStyle: const TextStyle ( fontSize: 11,  color: Colors.grey ),
      alignLabelWithHint: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(width: 1, color: Colors.white70),
      ),
      constraints: const BoxConstraints (maxHeight: 43.0),
      prefixIconColor: tDarkColor,
      floatingLabelStyle: const TextStyle(color: tDarkColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(width: 2, color: tDarkColor),
      ));



  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
      hintStyle: const TextStyle ( fontSize: 11, ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
      constraints: const BoxConstraints (maxHeight: 43.0),
      prefixIconColor: tDarkColor,
      floatingLabelStyle: const TextStyle(color: tDarkColor),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(100),
        borderSide: const BorderSide(width: 2, color: tDarkColor),
      ));
}
