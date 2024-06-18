import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/features/shop/screens/product_detail/widgets/product_detail_image_sider.dart';
import 'package:makemyhome/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:makemyhome/features/shop/screens/product_detail/widgets/rating_and_share.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            ProductDetailImageSlider(),

            Padding(
              padding: EdgeInsets.only(right: CustomSize.defaultSpace, left: CustomSize.defaultSpace, bottom: CustomSize.defaultSpace),
              child: Column(
                children: [
                 RatingAndShare(),

                 ProductMetaData(),
                ],
              ),
              ),
          ],
        ),
      ),
    );
  }
}
