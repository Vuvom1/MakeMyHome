import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return ListView.separated(
      separatorBuilder: (_, __) => const SizedBox(height: CustomSize.spaceBtwItem,),
      itemCount: 6,
      itemBuilder: (_, index) => TRoundedContainer(
        padding: EdgeInsets.all(CustomSize.md),
        showBorder: true,
        backgroundColor: dark ? CustomColor.black : CustomColor.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Icon(Iconsax.ship),
                    SizedBox(
                      width: CustomSize.spaceBtwItem / 2,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Processing',
                            style: Theme.of(context).textTheme.bodyLarge!.apply(
                                color: CustomColor.yellow, fontWeightDelta: 1),
                          ),
                          Text(
                            '04 Nov 2024',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    )
                  ],
                )),
                IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34))
              ],
            ),
      
            const SizedBox(height: CustomSize.spaceBtwItem,),
      
            Row(
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Icon(Iconsax.tag),
                    SizedBox(
                      width: CustomSize.spaceBtwItem / 2,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '[#23453]',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
      
                    
      
      
                  ],
                )),
      
                Expanded(
                    child: Row(
                  children: [
                    Icon(Iconsax.tag),
                    SizedBox(
                      width: CustomSize.spaceBtwItem / 2,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Date',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text(
                            '03 Feb 2024',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
      
                    
      
      
                  ],
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
