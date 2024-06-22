import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makemyhome/features/shop/controllers/cart_controller.dart';
import 'package:makemyhome/utils/helpers/pricing_calculator.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class BillingAmountSection extends StatelessWidget {
  const BillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Subtotal', style:  Theme.of(context).textTheme.bodyMedium),
          Text('\$${subTotal.toString()}', style:  Theme.of(context).textTheme.bodyMedium),
        ] ),

        const SizedBox(height: CustomSize.spaceBtwItem/2,),

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Shipping Fee', style:  Theme.of(context).textTheme.bodyMedium),
          Text('\$${PricingCalculator.calculatorShippingCost(subTotal, 'VN')}', style:  Theme.of(context).textTheme.labelLarge),
        ] ),

        const SizedBox(height: CustomSize.spaceBtwItem/2,),


         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Tax Fee', style:  Theme.of(context).textTheme.bodyMedium),
          Text('\$${PricingCalculator.calculatorTax(subTotal, 'VN')}', style:  Theme.of(context).textTheme.labelLarge),
        ] ),

        const SizedBox(height: CustomSize.spaceBtwItem/2,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Text('Order Total', style:  Theme.of(context).textTheme.bodyMedium),
          Text('\$${PricingCalculator.calculatorTotalPrice(subTotal, 'VN')}', style:  Theme.of(context).textTheme.titleLarge),
        ] ),

      ],
    );
  }
  
}