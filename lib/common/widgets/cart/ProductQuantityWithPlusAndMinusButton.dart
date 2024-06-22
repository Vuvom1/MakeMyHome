import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/icon/CircularIcon.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class ProductQuantityWithAddAndMinusButton extends StatelessWidget {
  const ProductQuantityWithAddAndMinusButton({
    super.key, required this.quantity, this.add, this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          onPressed: remove,
          size: CustomSize.md,
          color: CustomHelperFunctions.isDarkMode(context) ? CustomColor.white : CustomColor.black,
          backGroundColor: CustomHelperFunctions.isDarkMode(context) ? CustomColor.darkGrey : CustomColor.light,
          ),
    
          const SizedBox(width: CustomSize.spaceBtwItem,),
    
          Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall,),
    
          const SizedBox(width: CustomSize.spaceBtwItem),
    
          CircularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          onPressed: add,
          size: CustomSize.md,
          color: CustomHelperFunctions.isDarkMode(context) ? CustomColor.white : CustomColor.black,
          backGroundColor: CustomHelperFunctions.isDarkMode(context) ? CustomColor.darkGrey : CustomColor.yellow,
          ),
    
      ],
    );
  }
}