import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/common/widgets/texts/section_heading.dart';
import 'package:makemyhome/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class BillingAddressSection extends StatelessWidget {
  const BillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeading(
          title: 'Shiping Adddress',
          showActionButton: false,
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          'Minh vu',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        const SizedBox(
          height: CustomSize.spaceBtwItem / 2,
        ),
        Row(children: [
          const Icon(
            Icons.phone,
            color: Colors.grey,
            size: 16,
          ),
          const SizedBox(
            width: CustomSize.spaceBtwItem,
          ),
          Text('Empty phone number', style: Theme.of(context).textTheme.bodyMedium),
        ]),
        const SizedBox(
          height: CustomSize.spaceBtwItem / 2,
        ),
        Row(children: [
          const Icon(
            Icons.history_rounded,
            color: Colors.grey,
            size: 16,
          ),
          const SizedBox(
            width: CustomSize.spaceBtwItem,
          ),
          Text('Empty Address', style: Theme.of(context).textTheme.bodyMedium),
        ]),
        const SizedBox(
          height: CustomSize.spaceBtwItem / 2,
        ),
      ],
    );
  }
}
