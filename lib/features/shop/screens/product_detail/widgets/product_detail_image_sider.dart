import 'package:flutter/cupertino.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/images/rounded_image.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class ProductDetailImageSlider extends StatelessWidget {
  const ProductDetailImageSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return Container(
              color: dark ? CustomColor.darkGrey : CustomColor.light,
              child: Stack(
                children: [
                  SizedBox(
                    height: 400,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: 10),
                      child: Center(
                        child:
                            Image(
                              image: AssetImage(ImageString.product1,
                              )),
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
                        itemCount: 4,
                        separatorBuilder: (_, __) => const SizedBox(
                          width: CustomSize.spaceBtwItem,
                        ),
                        itemBuilder: (_, index) => TRoundedImage(
                          width: 80,
                          backGroundColor: dark ? CustomColor.black : CustomColor.white,
                          padding: EdgeInsets.all(CustomSize.sm),
                          imageUrl: ImageString.product2,
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