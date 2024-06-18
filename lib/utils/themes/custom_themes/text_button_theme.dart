import 'package:flutter/material.dart';

class CustomTextButtonTheme {
  CustomTextButtonTheme._();

   static final lightTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      disabledBackgroundColor: Colors.grey,
      padding: const EdgeInsets.symmetric(vertical: 18),
    )
  );
}