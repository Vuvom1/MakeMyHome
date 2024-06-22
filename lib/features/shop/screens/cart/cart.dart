import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/loaders/animation_loader.dart';
import 'package:makemyhome/features/shop/controllers/cart_controller.dart';
import 'package:makemyhome/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:makemyhome/features/shop/screens/checkout/checkout.dart';
import 'package:makemyhome/navigation_menu.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        final emptyWidget = Center(child: Text('Cart is Empty'));
        // TAnimationLoaderWidget(
        //   text: 'Cart Is Empty!',
        //   animation: ImageString.lightAppLogo,
        //   showAction: true,
        //   actionText: 'Let\'s fill it',
        //   onActionPressed: () => Get.off(() => const NavigationMenu()),
        //   );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(CustomSize.defaultSpace),
              child: CartItems(),
            ),
          );
        }
      }),
      bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(CustomSize.defaultSpace),
          child: ElevatedButton(
            onPressed: () => Get.to(() => CheckoutScreen()),
            child: Text('Check out \$${controller.totalCartPrice.value}'),
          )),
    );
  }
}
