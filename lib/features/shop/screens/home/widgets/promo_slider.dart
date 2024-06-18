import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:makemyhome/common/widgets/circular_containers/circular_container.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

import 'package:makemyhome/features/shop/controllers/home_controller.dart';

class PromoSlider extends StatelessWidget {
  const PromoSlider({super.key, required this.banners});

  final List<String> banners;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());


    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 1,
            onPageChanged: (index, _) => controller.updatePageIndicator(index),
          ),
          items: banners.map((url) => TRoundedImage (imageUrl: url)). toList(),
        ),

        const SizedBox(
          height: CustomSize.spaceBtwItem,
        ),

        Center(
          child: Obx(
            () => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < banners.length; i++)
                  TCircularContainer(
                      width: 10,
                      height: 10,
                      margin: 10,
                      backGroundColor: controller.carousalCurrentIndex.value == i
                          ? CustomColor.black
                          : CustomColor.darkGrey),
              ],
            ),
          ),
        ),
        
      ],
    );
  }
}
