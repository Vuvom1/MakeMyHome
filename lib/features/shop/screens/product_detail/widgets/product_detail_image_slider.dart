import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/features/shop/controllers/product/images_controller.dart';
import 'package:makemyhome/features/shop/models/product_model.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class ProductDetailImageSlider extends StatelessWidget {
  const ProductDetailImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);

    return Container(
      color: dark ? CustomColor.darkGrey : CustomColor.light,
      child: Stack(
        children: [
          SizedBox(
            height: 400,
            child: Padding(
              padding: const EdgeInsets.all(CustomSize.productImageRadius / 2),
              child: Center(
                child: Obx(() {
                  final image = controller.selectedProductImage.value;
                  return GestureDetector(
                    onTap: () => controller.showEnlargedImage(image),
                    child: CachedNetworkImage(
                      fit: BoxFit.contain,
                      imageUrl: image,
                      progressIndicatorBuilder: (_, __, downloadProgress) =>
                          CircularProgressIndicator(
                        value: downloadProgress.progress,
                        color: CustomColor.primary,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 30,
            left: CustomSize.defaultSpace,
            child: SizedBox(
              height: 80,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: AlwaysScrollableScrollPhysics(),
                itemCount: images.length,
                separatorBuilder: (_, __) => const SizedBox(
                  width: CustomSize.spaceBtwItem,
                ),
                itemBuilder: (_, index) => Obx( () {
                  final imageSelected = controller.selectedProductImage.value == images[index];

                  return TRoundedImage(
                    isNetworkImage: true,
                    width: 80,
                    onTap: () => controller.selectedProductImage.value = images[index],
                    backGroundColor: dark ? CustomColor.black : CustomColor.white,
                    padding: const EdgeInsets.all(CustomSize.sm),
                    imageUrl: images[index],
                  );
                }
                  
                ),
              ),
            ),
          ),
          const TAppBar(
            showBackArrow: true,
          )
        ],
      ),
    );
  }
}
