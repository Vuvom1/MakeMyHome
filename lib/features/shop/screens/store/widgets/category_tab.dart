import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/layout/grid_layout.dart';
import 'package:makemyhome/common/widgets/products/product_cards/product_card_vertical.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/features/shop/models/category_model.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return ListView(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(CustomSize.defaultSpace),
            child: Column(
              children: [
                TGridLayout(
                    itemCount: 6,
                    itemBuilder: (_, index) => const ProductCardVertical()),
              ],
            ),
          ),
        ]);
  }
}
