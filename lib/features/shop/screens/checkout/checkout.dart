import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/cart/coupon_widget.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/common/widgets/success_screen/success_screen.dart';
import 'package:makemyhome/features/shop/controllers/cart_controller.dart';
import 'package:makemyhome/features/shop/controllers/order_controller.dart';
import 'package:makemyhome/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:makemyhome/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:makemyhome/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:makemyhome/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/helpers/pricing_calculator.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = PricingCalculator.calculatorTotalPrice(subTotal, 'VN');
    final dark = CustomHelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Overview',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSize.defaultSpace),
          child: Column(
            children: [
              const CartItems(
                showAddRemoveButton: false,
              ),
              SizedBox(
                height: CustomSize.spaceBtwSections,
              ),
              CouponCode(dark: dark),
              SizedBox(
                height: CustomSize.spaceBtwSections,
              ),
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(CustomSize.md),
                backgroundColor: dark ? CustomColor.black : CustomColor.white,
                child: Column(
                  children: [
                    BillingAmountSection(),
                    SizedBox(
                      height: CustomSize.spaceBtwItem,
                    ),
                    Divider(),
                    SizedBox(
                      height: CustomSize.spaceBtwItem,
                    ),
                    BillingPaymentSection(),
                    SizedBox(
                      height: CustomSize.spaceBtwItem,
                    ),
                    BillingAddressSection(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(CustomSize.defaultSpace),
        child: ElevatedButton(
          onPressed: () => Get.to(() => SuccessScreen(
                image: ImageString.payment_success,
                title: 'Payment Success!',
                subTitle: 'Your items will be shipped soon',
                onPressed: () => orderController.processOrder(totalAmount),
              )),
          child: Text('Checkout \$${totalAmount.toString()}'),
        ),
      ),
    );
  }
}
