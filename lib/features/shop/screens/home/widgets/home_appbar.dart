import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/features/personalization/controllers/user_controller.dart';
import 'package:makemyhome/features/shop/screens/cart/cart.dart';
import 'package:makemyhome/features/shop/screens/home/widgets/cart_counter_icon.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            height: 40,
            image: AssetImage(ImageString.lightAppLogoWithName),
          ),
        ],
      ),
      actions: [
        CartCounterIcon(iconColor: CustomColor.white, counterBgColor: CustomColor.black, counterTextColor: Colors.white),
      ],
    );
  }
}
