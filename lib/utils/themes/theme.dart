import 'package:flutter/material.dart';
import 'package:makemyhome/utils/themes/custom_themes/appbar_theme.dart';
import 'package:makemyhome/utils/themes/custom_themes/checkbox_theme.dart';
import 'package:makemyhome/utils/themes/custom_themes/custom_chiptheme.dart';
import 'package:makemyhome/utils/themes/custom_themes/custom_textfieldtheme.dart';
import 'package:makemyhome/utils/themes/custom_themes/custom_texttheme.dart';
import 'package:makemyhome/utils/themes/custom_themes/elevated_button_theme.dart';
import 'package:makemyhome/utils/themes/custom_themes/outline_button_theme.dart';
import 'package:makemyhome/utils/themes/custom_themes/text_button_theme.dart';
import 'package:makemyhome/utils/themes/custom_themes/text_selection_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Montserrat', 
    brightness: Brightness.light,
    primaryColor: Colors.black12,
    scaffoldBackgroundColor: Colors.white,
    chipTheme: CustomChipTheme.lightChipTheme,
    textTheme: CustomTextTheme.lightTextTheme,
    inputDecorationTheme: CustomTextFieldTheme.lighInputDecorationTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlineButtonTheme.lightOutlineButtonTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    textButtonTheme: CustomTextButtonTheme.lightTextButtonTheme,
    textSelectionTheme: CustomTextSelectionTheme.lightTextSelectionTheme,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
  );
  static ThemeData darkTheme = ThemeData();
}