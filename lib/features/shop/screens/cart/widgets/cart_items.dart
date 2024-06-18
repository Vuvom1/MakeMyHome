import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/cart/ProductQuantityWithPlusAndMinusButton.dart';
import 'package:makemyhome/common/widgets/cart/cart_item.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_price_text.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class CartItems extends StatelessWidget {
  final bool showAddRemoveButton;

  const CartItems({
    super.key, 
    this.showAddRemoveButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CustomSize.defaultSpace),
      child: ListView.separated(
        shrinkWrap: true,
        separatorBuilder: (_, __) => const SizedBox(
          height: CustomSize.spaceBtwSections,
        ),
        itemCount: 4,
        itemBuilder: (_, __) => Column(
          children: [
            CartItem(),
            if (showAddRemoveButton) 
            SizedBox(
              height: CustomSize.spaceBtwItem,
            ),

            if (showAddRemoveButton)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 70,
                    ),
                    ProductQuantityWithAddAndMinusButton(),
                  ],
                ),
    
                  ProductPriceText(price: '190'),
    
              ],
            )
          ],
        ),
      ),
    );
  }
}
