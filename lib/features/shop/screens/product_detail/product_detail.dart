import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/texts/section_heading.dart';
import 'package:makemyhome/enums/enums.dart';
import 'package:makemyhome/features/shop/models/product_model.dart';
import 'package:makemyhome/features/shop/screens/product_detail/widgets/bottom_add_to_cart.dart';
import 'package:makemyhome/features/shop/screens/product_detail/widgets/product_attributes.dart';
import 'package:makemyhome/features/shop/screens/product_detail/widgets/product_detail_image_slider.dart';
import 'package:makemyhome/features/shop/screens/product_detail/widgets/product_meta_data.dart';
import 'package:makemyhome/features/shop/screens/product_detail/widgets/rating_and_share.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:readmore/readmore.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAddToCart(product: product,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductDetailImageSlider(
              product: product,
            ),
            Padding(
              padding: EdgeInsets.only(
                  right: CustomSize.defaultSpace,
                  left: CustomSize.defaultSpace,
                  bottom: CustomSize.defaultSpace),
              child: Column(
                children: [
                  RatingAndShare(),
                  ProductMetaData(
                    product: product,
                  ),
                    if(product.productType == ProductType.variable.toString()) ProductAttributes(
                      product: product),
                  const SizedBox(
                    height: CustomSize.spaceBtwSections,
                  ),
                  const TSectionHeading(
                      title: 'Description', showActionButton: false),
                  const SizedBox(height: CustomSize.spaceBtwItem),

                  const ReadMoreText(
                    'Product Description',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                   trimCollapsedText: 'Show more',
                   trimExpandedText: 'Less',
                   moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800), 
                   lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  const SizedBox(height: CustomSize.spaceBtwSections,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
