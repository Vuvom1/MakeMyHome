import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/products/ratings/rating_indicator.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(ImageString.defaultUserImage),
              ),
              const SizedBox(
                width: CustomSize.spaceBtwItem,
              ),
              Text(
                'My name',
                style: Theme.of(context).textTheme.titleSmall,
              )
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ]),
        const SizedBox(
          height: CustomSize.spaceBtwItem,
        ),
        Row(
          children: [
            const TRatingBarIndicator(rating: 4),
            const SizedBox(
              width: CustomSize.spaceBtwItem,
            ),
            Text(
              '01 Nov 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(
          height: CustomSize.spaceBtwItem,
        ),
        ReadMoreText(
          'The user interface of the app is quite intuitive, I was able to navigate and make purchaseThe user interface of the app is quite intuitive, I was able to navigate and make purchase',
          trimLines: 2,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CustomColor.yellow),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CustomColor.yellow),
        ),
        const SizedBox(
          height: CustomSize.spaceBtwItem,
        ),
        TRoundedContainer(
          backgroundColor: dark ? CustomColor.darkGrey : CustomColor.grey,
          child: Padding(
            padding: EdgeInsets.all(CustomSize.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'T s store',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '02 Nov, 2024',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: CustomSize.spaceBtwItem,
                ),
                const ReadMoreText(
                  'The user interface of the app is quite intuitive, I was able to navigate and make purchaseThe user interface of the app is quite intuitive, I was able to navigate and make purchase',
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: ' show less',
                  trimCollapsedText: 'show more',
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.white),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: CustomColor.white),
                ),
               
              ],
            ),
          ),
        )
      ],
    );
  }
}
