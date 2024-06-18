import 'package:flutter/material.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class SpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: CustomSize.appBarHeight,
    left: CustomSize.defaultSpace,
    right: CustomSize.defaultSpace,
    bottom: CustomSize.defaultSpace,
  );
}