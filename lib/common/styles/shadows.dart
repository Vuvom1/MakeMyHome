import 'package:flutter/material.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';

class TShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: CustomColor.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  static final horizontalProductShadow = BoxShadow(
    color: CustomColor.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}