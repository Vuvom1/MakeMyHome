import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
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
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: CustomColor.black),),
            ), 

            const SizedBox(width: CustomSize.spaceBtwItem,),

            // In progress
          ],
          
        )
      ],
    );
    
  }
  
}