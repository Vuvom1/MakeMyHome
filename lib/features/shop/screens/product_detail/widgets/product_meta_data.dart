import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_price_text.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_title_text.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/enums/enums.dart';
import 'package:makemyhome/features/shop/controllers/product/product_controller.dart';
import 'package:makemyhome/features/shop/models/product_model.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = CustomHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            TRoundedContainer(
              radius: CustomSize.sm,
              backgroundColor: CustomColor.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: CustomSize.sm, vertical: CustomSize.xs),
              child: Text('$salePercentage%', style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColor.black),),
            ), 

            const SizedBox(width: CustomSize.spaceBtwItem,),

            if (product.productType == ProductType.single.toString() && product.salePrice > 0) 
              Text('\$${product.price}', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),

            if(product.productType == ProductType.single.toString() && product.salePrice > 0) const SizedBox(width: CustomSize.spaceBtwItem),
              ProductPriceText(price: controller.getProductPrice(product), isLarge: true),

          ],
          
        ),

        const SizedBox(height: CustomSize.spaceBtwItem / 1.5),

        ProductTitleText(title: product.title), 
        const SizedBox(height: CustomSize.spaceBtwItem / 1.5),
        
        Row(
          children: [
            const ProductTitleText(title: 'Status'), const SizedBox(width: CustomSize.spaceBtwItem),
            Text(controller.getProductStockStatus(product.stock), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),

        const SizedBox(height: CustomSize.spaceBtwItem / 1.5),
        
        


      ],
    );
    
  }
  
}