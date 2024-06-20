import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/layout/grid_layout.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:makemyhome/common/widgets/shimmer/vertical_product_shimmer.dart';
import 'package:makemyhome/features/shop/controllers/category_controller.dart';
import 'package:makemyhome/features/shop/models/category_model.dart';
import 'package:makemyhome/utils/helpers/cloud_helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(CustomSize.defaultSpace),
            child: Column(
              children: [
               FutureBuilder(
                future: controller.getCategoryProduct(categoryId: category.id), 
                builder: (context, snapshot) {

                  final response = CloudHelperFunctions.checkMUltiRecordState(snapshot: snapshot, loader: const VerticalProductShimmer());
                  if (response != null) return response;

                 final products = snapshot.data!;

                return Column(
                  children: [
                    TGridLayout(itemCount: products.length, itemBuilder: (_, index) => ProductCardVertical(product: products[index]))
                  ],
                );
               })
              ],
            ),
          ),
        ]);
  }
}
