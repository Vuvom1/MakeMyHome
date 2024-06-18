import 'package:flutter/material.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerEffect extends StatelessWidget {
  final double width, height, radius;
  final Color? color;

  const ShimmerEffect(
      {
      Key? key,
      required this.width,
      required this.height,
      this.radius = 15,
      this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Shimmer.fromColors(
    
      baseColor: dark ? Colors.grey[850]! : Colors.grey[300]!, 
      highlightColor: dark ? Colors.grey[700]! : Colors.grey [100]!,      
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (dark ? CustomColor.darkGrey : CustomColor.white),
          borderRadius: BorderRadius.circular(radius)
        ),
      ),
      ) ;
  }
}
