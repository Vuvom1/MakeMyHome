import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/enums/enums.dart';
import 'package:makemyhome/features/shop/controllers/cart_controller.dart';
import 'package:makemyhome/features/shop/models/product_model.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  ProductCardAddToCartButton({
    required this.product,
    super.key,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {

        }
      },
      child: Obx(
        () {
          final productQuantityInCart = cartController.getProductQuantityInCart(product.id);

          return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? CustomColor.yellow :  CustomColor.black,
          ),
          child: SizedBox(
              width: CustomSize.iconLg * 1.2,
              height: CustomSize.iconLg * 1.2,
              child: Center(
                  child: productQuantityInCart > 0 ? Text(productQuantityInCart.toString(), style: Theme.of(context).textTheme.bodyLarge!.apply(color: CustomColor.white),) :  const Icon(
                Iconsax.add,
                color: CustomColor.white,
              ))),
        );
        } 
      ),
    );
  }
}
