import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:makemyhome/common/widgets/circular_containers/circular_container.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/common/widgets/shimmer/shimmer_effect.dart';
import 'package:makemyhome/features/shop/controllers/banner_controller.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());

    return Obx(() {
      if (controller.isLoading.value)
        return const ShimmerEffect(width: double.infinity, height: 120);

      if (controller.banners.isEmpty) {
        return const Center(
          child: Text('No Data Found!'),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, _) =>
                    controller.updatePageIndicator(index),
              ),
              items: controller.banners
                  .map((banner) => TRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        onTap: () => Get.to(banner.targetScreen),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: CustomSize.spaceBtwItem,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      TCircularContainer(
                          width: 10,
                          height: 10,
                          margin: 10,
                          backgroundColor:
                              controller.carousalCurrentIndex.value == i
                                  ? CustomColor.black
                                  : CustomColor.darkGrey),
                  ],
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
