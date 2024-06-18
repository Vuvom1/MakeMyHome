import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/circular_containers/circular_container.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_price_text.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_title_text.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/features/shop/screens/product_detail/product_detail.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
        width:  180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(CustomSize.productImageRadius),
          color: dark ? CustomColor.darkGrey : CustomColor.transparent,
        ),
        child: Column(
          children: [
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.only(bottom: CustomSize.sm),
              backgroundColor: dark ? CustomColor.black : CustomColor.primary,
              child: Stack(
                children: [
                  const TRoundedImage(imageUrl: ImageString.categoryBed, applyImageRadius: true,),
      
                  Positioned(
                    left: 10,
                    top: 5,
                    child: TRoundedContainer(
                      radius: 0,
                      backgroundColor: CustomColor.yellow.withOpacity(0.8),
                      child: Text('-45%', style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColor.black),),
                    ),
                  ),
      
                 
      
                ],
              ),
            ), 
      
            Padding(
              padding: EdgeInsets.only(left: CustomSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(title: 'Greate Bed', smallSize: true,),
                  SizedBox(height: CustomSize.spaceBtwItem/2,),
                  Row(
                    children: [
                      Text('Beds', overflow: TextOverflow.ellipsis, maxLines: 1, style: Theme.of(context).textTheme.labelMedium,),
                      const SizedBox(width: CustomSize.xs,),
                    ],
                  ),
      
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        ProductPriceText(price: '234.00',),
                        Container(decoration: const BoxDecoration(
                          color: CustomColor.black,
                          // borderRadius: BorderRadius.only(
                          //   topLeft: Radius.circular(CustomSize.cardRadiusMd),
                          //   bottomRight: Radius. circular(CustomSize.productImageRadius),
                          // )
                        ),
                        child: SizedBox(
                          width: CustomSize.iconLg * 1.2,
                          height: CustomSize.iconLg * 1.2,
                          child: Center(child: const Icon(Iconsax.add, color: CustomColor.white,))),
                        )
                    ],
                  ),
      
                ],
              ),
              )
            
        ],),
      ),
    );
  }
  
}