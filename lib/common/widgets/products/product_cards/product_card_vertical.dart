import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_price_text.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_title_text.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/enums/enums.dart';
import 'package:makemyhome/features/shop/controllers/product/product_controller.dart';
import 'package:makemyhome/features/shop/models/product_model.dart';
import 'package:makemyhome/features/shop/screens/product_detail/product_detail.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class ProductCardVertical extends StatelessWidget {
  const ProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);
    final dark = CustomHelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailScreen(
            product: product,
          )),
      child: Container(
        width: 180,
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
                  TRoundedImage(
                    imageUrl: product.thumbnail,
                    isNetworkImage: true,
                    applyImageRadius: true,
                  ),
                  Positioned(
                    left: 10,
                    top: 5,
                    child: TRoundedContainer(
                      radius: 0,
                      backgroundColor: CustomColor.yellow.withOpacity(0.8),
                      child: Text(
                        '$salePercentage%',
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
            Padding(
              padding: EdgeInsets.only(left: CustomSize.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    title: product.title,
                    smallSize: true,
                  ),
                  SizedBox(
                    height: CustomSize.spaceBtwItem / 2,
                  ),
                  Row(
                    children: [
                      Text(
                        product.productType,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        width: CustomSize.xs,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(children: [
                          if (product.productType ==
                                  ProductType.single.toString() &&
                              product.salePrice > 0)
                            Padding(
                                padding: EdgeInsets.only(left: CustomSize.sm),
                                child: Text(
                                  product.price.toString(),
                                  style: Theme.of(context).textTheme. labelMedium!.apply(decoration: TextDecoration.lineThrough),
                                )
                                ),
                          Padding(
                            padding: const EdgeInsets.only(left: CustomSize.sm),
                            child: ProductPriceText(
                                price: controller.getProductPrice(product)),
                          )
                        ]),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: CustomColor.black,
                        ),
                        child: SizedBox(
                            width: CustomSize.iconLg * 1.2,
                            height: CustomSize.iconLg * 1.2,
                            child: Center(
                                child: const Icon(
                              Iconsax.add,
                              color: CustomColor.white,
                            ))),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
