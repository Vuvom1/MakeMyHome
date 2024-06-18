import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class TSingleAddress extends StatelessWidget {
  const TSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);
    return TRoundedContainer(
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress ? CustomColor.secondary.withOpacity(0.2) : Colors.transparent,
      borderColor: selectedAddress ? Colors.transparent : dark ? CustomColor.darkGrey  : CustomColor.grey,
      margin: const EdgeInsets.only(bottom: CustomSize.spaceBtwItem),
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          Positioned(
            right: 5,
            top: 0,
            child: Icon(
              selectedAddress ? Iconsax.tick_circle5 : null,
              color: selectedAddress ? dark ? CustomColor.light : CustomColor.black : null,
            ),
          ), 

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Minh Vu',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge,
              ),

              const SizedBox(height: CustomSize.sm / 2,),
              const Text('phone number', maxLines: 1, overflow: TextOverflow.ellipsis,),
              const SizedBox(height: CustomSize.sm / 2,),
              const Text('82356 Timmy Coves, South Liana, Maine, 87665, USA', softWrap: true,),
            ],
          )
        ],
      ),
    );
  }
  
}