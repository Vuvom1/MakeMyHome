import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_title_text.dart';
import 'package:makemyhome/features/shop/models/cart/cart_item_model.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class CartItem extends StatelessWidget {
  final CartItemModel item;

  const CartItem({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          isNetworkImage: true,
          padding: EdgeInsets.all(CustomSize.sm),
          width: 60,
          height: 60,
          imageUrl: item.image ?? '',
          backGroundColor: CustomHelperFunctions.isDarkMode(context)
              ? CustomColor.darkGrey
              : CustomColor.white,
        ),
        const SizedBox(
          width: CustomSize.spaceBtwItem,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: ProductTitleText(
                title: item.title,
                maxLines: 1,
              ),
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                children: (item.selectedVariation ?? {})
                    .entries
                    .map((e) => TextSpan(children: [
                          TextSpan(
                              text: ' ${e.key} ',
                              style: Theme.of(context).textTheme.bodySmall),
                          TextSpan(
                              text: ' ${e.value} ',
                              style: Theme.of(context).textTheme.labelLarge),
                        ]))
                    .toList(),
              ),
            ])),
          ],
        )
      ],
    );
  }
}
