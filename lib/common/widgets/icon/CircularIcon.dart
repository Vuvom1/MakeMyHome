import 'package:flutter/material.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class CircularIcon extends StatelessWidget {
  

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backGroundColor;
  final VoidCallback? onPressed;

  const CircularIcon({
    super.key, 
    this.width, 
    this.height, 
    this.size  = CustomSize.lg, 
    required this.icon, 
    this.color, 
    this.backGroundColor, 
    this.onPressed
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backGroundColor != null ? backGroundColor! : CustomHelperFunctions.isDarkMode(context) ? CustomColor.black.withOpacity(0.9) : CustomColor.white.withOpacity(0.9) ,
        borderRadius: BorderRadius.circular(100),
      ),
      child: IconButton(onPressed: onPressed, icon: Icon(icon, color: color, size: size,),),
    );
  }
  
}