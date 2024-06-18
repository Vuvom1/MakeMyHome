import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/products/ratings/rating_indicator.dart';
import 'package:makemyhome/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:makemyhome/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text('Reviews and Rating'),
        showBackArrow: true,
      ),

      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSize.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                const Text('Ratings and reviews are verified and are from people who use the same type of device that you use.'),
                const SizedBox(height: CustomSize.spaceBtwItem,),

                TOverallProductRating(),

                TRatingBarIndicator(rating: 3.6),

                Text("12,233", style: Theme.of(context).textTheme.bodySmall,),
                const SizedBox(height: CustomSize.spaceBtwSections,),

                //User Review 
                UserReviewCard(),

            ],
            
          ),
        ),
      ),
    );
  }
  
}

