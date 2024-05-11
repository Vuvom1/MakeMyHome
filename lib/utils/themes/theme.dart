import 'package:flutter/material.dart';
import 'package:makemyhome/utils/themes/custom_themes/custom_textfieldtheme.dart';
import 'package:makemyhome/utils/themes/custom_themes/custom_texttheme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat', 
    brightness: Brightness.light,
    primaryColor: Colors.yellow,
    scaffoldBackgroundColor: Colors.white,
    textTheme: CustomTextTheme.lightTextTheme,
    inputDecorationTheme: CustomTextFieldTheme.lighInputDecorationTheme,
    // '#FBE74D'
  );
  static ThemeData darkTheme = ThemeData();
}