import 'package:flutter/widgets.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';

class TCircularContainer extends StatelessWidget {
  final double? width;
  final double? height;
  final double radius;
  final double padding;
  final double margin;
  final Widget? child;
  final Color backGroundColor;

  const TCircularContainer({
    super.key, 
    this.width, 
    this.height, 
    this.radius = 400, 
    this.padding = 0, 
    this.margin = 0, 
    this.child, 
    this.backGroundColor = CustomColor.white,
    });
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: EdgeInsets.all(margin),
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backGroundColor,
      ),
      child: child,
    );
  }

  
}
