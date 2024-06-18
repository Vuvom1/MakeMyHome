import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/common/widgets/loaders/animation_loader.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!, 
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: Container(
          color: CustomHelperFunctions.isDarkMode(Get.context!) ? CustomColor.black : CustomColor.white,
          width: double.infinity,
          height: double.infinity,
          child: Column(
            children: [
              const SizedBox(height: 300,),
              TAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
        )
      );
  }

  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}