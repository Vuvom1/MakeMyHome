import 'package:flutter/material.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class TRoundedImage extends StatelessWidget {
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backGroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onTap;
  final double borderRadius;

  const TRoundedImage({
    super.key, 
    this.width , 
    this.height, 
    required this.imageUrl,
    this.applyImageRadius = true, 
    this.border, 
    this.backGroundColor = CustomColor.white, 
    this.fit = BoxFit.cover, 
    this.padding, 
    this.isNetworkImage = false, 
    this.onTap, 
    this.borderRadius = CustomSize.md,
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: border, 
          color: backGroundColor, 
          borderRadius: BorderRadius.circular(borderRadius),
          ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero, 
          child: Image(
            fit: fit,
            image: isNetworkImage ? NetworkImage(imageUrl) : AssetImage(imageUrl) as ImageProvider,
            
          ),
        ),
      ),
    );
  }
  
}
