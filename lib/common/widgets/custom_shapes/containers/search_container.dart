import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/device/device_utility.dart';

class TSearchContainer extends StatelessWidget {

  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;

  const TSearchContainer({super.key, required this.text, this.icon, this.showBackground = true, this.showBorder = true, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: CustomSize.defaultSpace),
                    child: Container(
                      width: DeviceUtility.getScreenWidth(context),
                      padding: EdgeInsets.all(CustomSize.md),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(CustomSize.cardRadiusSm),
                        border: Border.all(color: CustomColor.black),
                      ),
                      child: Row(
                        children: [
                          const Icon(Iconsax.search_normal, color: CustomColor.darkGrey, size: CustomSize.iconMd,),
                          const SizedBox(width: CustomSize.spaceBtwItem,),
                          Text('Search product', style: Theme.of(context).textTheme.bodySmall,),
                        ],
                      ),
                    ),
                  ),
    );
  }
  
}
