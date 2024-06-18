import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:makemyhome/common/widgets/shimmer/shimmer_effect.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';

class TCircularImage extends StatelessWidget {
  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? backgroundColor;
  final Color? overlayColor;
  final double width, height, padding;

  const TCircularImage({
    super.key,
    this.fit,
    required this.image,
    this.isNetworkImage = false,
    this.backgroundColor,
    required this.width,
    required this.height,
    this.padding = 0,
    this.overlayColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor ??
            (CustomHelperFunctions.isDarkMode(context)
                ? CustomColor.black
                : CustomColor.white),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Center(
            child: isNetworkImage
                ? CachedNetworkImage(
                    fit: fit,
                    color: overlayColor,
                    imageUrl: image,
                    progressIndicatorBuilder: (context, url, downloadProgress) =>
                        const ShimmerEffect(width: 55, height: 55),
                  )
                : Image(
                    image: AssetImage(image),
                    fit: fit,
                    color: overlayColor,
                  )),
      ),
    );
  }
}
