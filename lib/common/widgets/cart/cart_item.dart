import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_text/product_title_text.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          padding: EdgeInsets.all(CustomSize.sm),
          width: 60,
          height: 60,
          imageUrl: ImageString.product1,
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
                title: 'Bed with drap',
                maxLines: 1,
              ),
            ),

            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'Color ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                 text: 'Grey ', style: Theme.of(context).textTheme.bodyLarge),

              TextSpan(
                  text: 'Size ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                 text: '180x100 ', style: Theme.of(context).textTheme.bodyLarge),
            ])),
          ],
        )
      ],
    );
  }
}
