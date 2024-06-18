import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class CouponCode extends StatelessWidget {
  const CouponCode({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return TRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? CustomColor.black : CustomColor.white,
      padding: const EdgeInsets.only(top: CustomSize.sm, bottom: CustomSize.sm, right: CustomSize.sm, left: CustomSize.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
    
              ),
            )
            ),
    
            SizedBox(child: ElevatedButton(onPressed: () {}, child: Text('Apply')))
        ],
      ),
    );
  }
}