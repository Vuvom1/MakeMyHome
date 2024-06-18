import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_card_horizontal.dart';
import 'package:makemyhome/common/widgets/texts/section_heading.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Table'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSize.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(width: double.infinity, imageUrl: ImageString.banner_1,),
              const SizedBox(height: CustomSize.spaceBtwItem,),

              Column(
                children: [
                  TSectionHeading(title: 'Working Table', onPressed: () {}),
                  const SizedBox(height: CustomSize.spaceBtwItem / 2,),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 5,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: CustomSize.spaceBtwItem,),
                      itemBuilder:(context, index) => const ProductCardHoriontal(),
                      ),
                  ),
                ],
              )
            ],
          ),
          ),
      ),
    );
  }
}
