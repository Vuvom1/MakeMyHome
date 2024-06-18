import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText(
      {super.key,
      required this.image,
      required this.title,
      this.textColor = CustomColor.white,
      this.backGroundColor,
      this.onTap});

  final String image, title;
  final Color textColor;
  final Color? backGroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: CustomSize.spaceBtwItem / 10),
        child: Column(
          children: [
            Container(
              width: 120,
              height: 120,
              padding: const EdgeInsets.all(CustomSize.sm),
              decoration: BoxDecoration(
                color: CustomColor.transparent,
                borderRadius: BorderRadius.circular(0),
              ),
              child: Center(
                child: CachedNetworkImage(
                  imageUrl: image,
                ),
              ),
            ),
            const SizedBox(
              height: CustomSize.spaceBtwItem / 2,
            ),
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: CustomColor.black),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
