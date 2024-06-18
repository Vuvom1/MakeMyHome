import 'package:flutter/material.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class TRoundedContainer extends StatelessWidget {
  final double? width; 
  final double? height; 
  final double radius; 
  final Widget? child; 
  final bool showBorder;
  final Color borderColor;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const TRoundedContainer({
    super.key, 
    this.width, 
    this.height, 
    this.radius = CustomSize.cardRadiusSm, 
    this.child, 
    this.showBorder = false, 
    this.borderColor = CustomColor.borderColor, 
    this.backgroundColor = CustomColor.white, 
    this.padding, 
    this.margin,
    });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: showBorder ? Border.all(color: borderColor) : null,
      ),
      child: child,
    );
  }
}