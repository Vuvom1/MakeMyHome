import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class RatingAndShare extends StatelessWidget {
  const RatingAndShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Iconsax.star5,
              color: Colors.amber,
              size: 24,
            ),
            SizedBox(
              width: CustomSize.spaceBtwItem / 2,
            ),
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: '5.0 ', style: Theme.of(context).textTheme.bodyLarge),
              const TextSpan(text: '(199)'),
            ]))
          ],
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share,
              size: CustomSize.iconMd,
            )),
      ],
    );
  }
}
