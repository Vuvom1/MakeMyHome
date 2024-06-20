import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/icon/CircularIcon.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: CustomSize.defaultSpace,
          vertical: CustomSize.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? CustomColor.darkGrey : CustomColor.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(CustomSize.cardRadiusLg),
          topRight: Radius.circular(CustomSize.cardRadiusLg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircularIcon(
                icon: Iconsax.minus,
                backGroundColor: CustomColor.darkGrey,
                width: 40,
                height: 40,
                color: CustomColor.white,
              ),
              const SizedBox(
                width: CustomSize.spaceBtwItem,
              ),
              Text('2', style: Theme.of(context).textTheme.titleSmall),
              const SizedBox(width: CustomSize.spaceBtwItem),
              CircularIcon(
                icon: Iconsax.add,
                backGroundColor: CustomColor.black,
                width: 40,
                height: 40,
                color: CustomColor.white,
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {}, 
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(CustomSize.md),
              backgroundColor: CustomColor.black,
              side: const BorderSide(color: CustomColor.black),
            ),
            child: Text('Add to Cart'),
            )
        ],
      ),
    );
  }
}
