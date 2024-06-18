import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/features/personalization/controllers/update_name_controller.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/validators/vallidation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Change Name' , style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: Padding(
        padding: const EdgeInsets.all(CustomSize.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Use real name for easy vertification. This name will appear on several pages.', style: Theme.of(context).textTheme.labelMedium,),
          const SizedBox(height: CustomSize.spaceBtwSections,),

          Form(
            key: controller.updateUserNameFormKey,
            child: Column(
              children: [
                TextFormField(
                 controller: controller.firstName,
                 validator: (value) => TValidator.validateEmptyText('First Name', value),
                 expands: false,
                 decoration: const InputDecoration(labelText: 'First Name', prefixIcon: Icon(Iconsax.user)), 
                ),


                SizedBox(height: CustomSize.spaceBtwItem,),

                TextFormField(
                 controller: controller.lastName,
                 validator: (value) => TValidator.validateEmptyText('Last Name', value),
                 expands: false,
                 decoration: const InputDecoration(labelText: 'Last Name', prefixIcon: Icon(Iconsax.user)), 
                )
              ],
            ),
          ),

          const SizedBox(height: CustomSize.spaceBtwSections,),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () => controller.updateUserName(),child: const Text('Save'),),
          )
        ],
      ),),
    );
  }
}
