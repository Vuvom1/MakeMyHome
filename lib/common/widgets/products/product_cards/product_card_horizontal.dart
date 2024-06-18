import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_price_text.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_title_text.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/features/shop/screens/product_detail/product_detail.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class ProductCardHoriontal extends StatelessWidget {
  const ProductCardHoriontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => const ProductDetailScreen()),
      child: Container(
          width: 310,
          padding: const EdgeInsets.all(1),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(CustomSize.productImageRadius),
            color: dark ? CustomColor.darkGrey : CustomColor.light,
          ),
          child: Row(
            children: [
              TRoundedContainer(
                height: 120,
                padding: const EdgeInsets.all(CustomSize.sm),
                backgroundColor: dark ? CustomColor.black : CustomColor.transparent,
                child: Stack(
                  children: [
                    SizedBox(
                        height: 120,
                        width: 120,
                        child: TRoundedImage(imageUrl: ImageString.product1),),
                    Positioned(
                      top: 12,
                      child: TRoundedContainer(
                        radius: CustomSize.sm,
                        backgroundColor: CustomColor.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: CustomSize.sm, vertical: CustomSize.xs),
                        child: Text(
                          '25%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: CustomColor.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 172,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: CustomSize.sm, left: CustomSize.sm, right: CustomSize.sm),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                        Column(
                          children: [
                            ProductTitleText(
                              title: 'Working Desk',
                              smallSize: true,
                            ),
                            SizedBox(
                              height: CustomSize.spaceBtwItem * 2,
                            ),
                            
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(child: ProductPriceText(price: '256.0')),
                            Container(
                              decoration: BoxDecoration(
                                color: CustomColor.black,
                                borderRadius: BorderRadius.all(
                                    Radius.circular(CustomSize.cardRadiusSm / 4)),
                              ),
                              child: SizedBox(
                                width: CustomSize.iconLg ,
                                height: CustomSize.iconLg ,
                                child: Center(
                                  child: Icon(
                                    Iconsax.add,
                                    color: CustomColor.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        )
                      ]),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}
