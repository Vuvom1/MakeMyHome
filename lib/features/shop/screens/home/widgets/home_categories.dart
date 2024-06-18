import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:makemyhome/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:makemyhome/common/widgets/shimmer/category_shimmer.dart';
import 'package:makemyhome/features/shop/controllers/category_controller.dart';
import 'package:makemyhome/features/shop/screens/sub_category/sub_categories.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(() {
      if(categoryController.isLoading.value) return const CategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
        return Center(child: Text('No data found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
      }
      return SizedBox(
        height: 200,
        child: ListView.builder(
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];

              return TVerticalImageText(
                image: category.image,
                title: category.name,
                textColor: CustomColor.black,
                onTap: () => Get.to(() => const SubCategoriesScreen()),
              );
            }),
      );
    });
  }
}
