import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/cart/ProductQuantityWithPlusAndMinusButton.dart';
import 'package:makemyhome/common/widgets/cart/cart_item.dart';
import 'package:makemyhome/common/widgets/icon/CircularIcon.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_price_text.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_title_text.dart';
import 'package:makemyhome/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:makemyhome/features/shop/screens/checkout/checkout.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: CartItems(),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(CustomSize.defaultSpace),
        child: ElevatedButton(onPressed: () => Get.to(() => CheckoutScreen()), child: Text('Check out \$780'),)
        ),
    );
  }
}

