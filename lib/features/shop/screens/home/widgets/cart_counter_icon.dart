import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/features/shop/controllers/cart_controller.dart';
import 'package:makemyhome/features/shop/screens/cart/cart.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';

class CartCounterIcon extends StatelessWidget {
  final Color? iconColor, counterBgColor, counterTextColor;

  const CartCounterIcon({
    super.key, 
    this.iconColor, 
    this.counterBgColor, 
    this.counterTextColor
    });
  
  @override
  Widget build(BuildContext context) {

    final controller =  Get.put(CartController());
    final dark = CustomHelperFunctions.isDarkMode(context);

    return Stack(
      children: [
        IconButton(onPressed: () => Get.to(() => CartScreen()), icon: Icon(Iconsax.shopping_bag, color: CustomColor.black, size: 25,)),
        Positioned(
          right: 0,
          child: Container(
             width: 15,
             height: 15,
             decoration: BoxDecoration(
              color: counterBgColor ?? (dark ? CustomColor.white : CustomColor.black),
              borderRadius: BorderRadius.circular(100),
             ),
             child: Center(
              child: Obx(
                () => Text(
                    controller.noOfCartItems.value.toString(), 
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                    color: counterTextColor ?? (dark ? Colors.black : CustomColor.white),
                    fontSizeFactor: 0.8,
                  ),),
              ),
              ),
             ),
          )
          
      ],
    );
  }
  
}