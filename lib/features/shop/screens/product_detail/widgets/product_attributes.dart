import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/route_manager.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_price_text.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_title_text.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/common/widgets/texts/section_heading.dart';
import 'package:makemyhome/features/shop/controllers/variation_controller.dart';
import 'package:makemyhome/features/shop/models/product_model.dart';
import 'package:makemyhome/features/shop/screens/product_detail/widgets/choice_chip.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class ProductAttributes extends StatelessWidget {
  final ProductModel product;

  const ProductAttributes({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = CustomHelperFunctions.isDarkMode(context);

    return Obx( () =>  Column(
        children: [
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(CustomSize.md),
              backgroundColor: dark ? CustomColor.darkGrey : CustomColor.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      TSectionHeading(
                        title: 'Variations',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: CustomSize.spaceBtwItem,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const ProductTitleText(
                                title: 'Price : ',
                                smallSize: true,
                              ),
                              if (controller.selectedVariation.value.salePrice > 0)
                              Text(
                                '\$${controller.selectedVariation.value.price}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .apply(
                                        decoration: TextDecoration.lineThrough),
                              ),
                              const SizedBox(width: CustomSize.spaceBtwItem),
                              ProductPriceText(price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(children: [
                            const ProductTitleText(
                                title: 'Stock : ', smallSize: true),
                            Text('In Stock',
                                style: Theme.of(context).textTheme.titleMedium),
                          ]),
                        ],
                      )
                    ],
                  ),

                  ProductTitleText(
                    title:  controller.selectedVariation.value.description ?? '',
                    smallSize: true,
                    maxLines: 4,
                    ),
                ],
              ),
            ),
          const SizedBox(
            height: CustomSize.spaceBtwItem,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TSectionHeading(
                          title: attribute.name ?? '',
                          showActionButton: false,
                        ),
                        const SizedBox(height: CustomSize.spaceBtwItem),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller.selectedAttributes[attribute.name] == attributeValue;
                          
                              final available = controller.getAttributesAvailabilityInVariation(product.productVariations!, attribute.name!).contains(attributeValue);
                              return TChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available ? (selected) {
                                    if (selected && available) {
                                      controller.onAttributeSelected(product, attribute.name ?? '', attributeValue);
                                    }
                                  } : null);
                            }).toList(),
                          ),
                        )
                      ],
                    ))
                .toList(),
          )
        ],
      ),
    );
  }
}
