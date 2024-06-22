import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/icon/CircularIcon.dart';
import 'package:makemyhome/features/shop/controllers/cart_controller.dart';
import 'package:makemyhome/features/shop/models/product_model.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class BottomAddToCart extends StatelessWidget {
  const BottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    
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
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                  CircularIcon(
                    onPressed: () => controller.productQuantityInCart.value < 1 ? null: controller.productQuantityInCart.value -= 1,
                    icon: Iconsax.minus,
                    backGroundColor: CustomColor.darkGrey,
                    width: 40,
                    height: 40,
                    color: CustomColor.white,
                  ),
                  const SizedBox(
                    width: CustomSize.spaceBtwItem,
                  ),
                  Text(controller.productQuantityInCart.value.toString(), style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(width: CustomSize.spaceBtwItem),
                  CircularIcon(
                    onPressed: () => controller.productQuantityInCart.value += 1,
                    icon: Iconsax.add,
                    backGroundColor: CustomColor.black,
                    width: 40,
                    height: 40,
                    color: CustomColor.white,
                  ),
                ],
              ),
          
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1 ? null :() => controller.addToCart(product),
              // onPressed: controller.productQuantityInCart.value < 1 ? null : () => controller.addToCart(product), 
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(CustomSize.md),
                backgroundColor: CustomColor.black,
                side: const BorderSide(color: CustomColor.black),
              ),
              child: Text('Add to Cart'),
              )
          ],
        ),
      ),
    );
  }
}
