import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/common/widgets/custom_shapes/containers/primary_header.dart';
import 'package:makemyhome/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:makemyhome/common/widgets/layout/grid_layout.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:makemyhome/common/widgets/texts/section_heading.dart';
import 'package:makemyhome/features/shop/screens/all_products/all_products.dart';
import 'package:makemyhome/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:makemyhome/features/shop/screens/home/widgets/home_categories.dart';
import 'package:makemyhome/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          TPrimaryHeaderContainer(
              child: Column(
            children: [
              THomeAppBar(),
              SizedBox(
                height: CustomSize.spaceBtwSections,
              ),
              TSearchContainer(text: 'Search Products'),
            ],
          )),
          SizedBox(
            height: CustomSize.spaceBtwSections,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: CustomSize.defaultSpace),
            child: Column(
              children: [
                PromoSlider(
                  banners: [
                    ImageString.banner_1,
                    ImageString.banner_2,
                    ImageString.banner_3,
                    ImageString.banner_4,
                    ImageString.banner_5
                  ],
                ),
                SizedBox(
                  height: CustomSize.spaceBtwItem,
                ),
                TSectionHeading(
                  title: 'Product Categories',
                  buttonTitle: 'All',
                  showActionButton: true,
                  onPressed: () => Get.to(() => AllProductsScreen()),

                ),
                SizedBox(
                  height: CustomSize.spaceBtwItem,
                ),
                THomeCategories(),
                SizedBox(
                  height: CustomSize.spaceBtwItem,
                ),
                 TSectionHeading(
                  title: 'You might like',
                  buttonTitle: 'All',
                  showActionButton: false,
                ),
                SizedBox(
                  height: CustomSize.spaceBtwItem,
                ),
                TGridLayout(
                    itemCount: 4,
                    itemBuilder: (_, index) => ProductCardVertical())
              ],
            ),
          ),

          
        ],
      ),
    ));
  }
}
