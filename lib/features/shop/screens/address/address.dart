import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/features/shop/screens/address/add_new_address.dart';
import 'package:makemyhome/features/shop/screens/address/widgets/single_address.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColor.black,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: CustomColor.white,),
      ),
      appBar: TAppBar(
         showBackArrow: true,
         title: Text('Address', style: Theme.of(context).textTheme.headlineSmall,),
      ),

      body: const SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(CustomSize.defaultSpace),
        child: Column(
          children: [
            TSingleAddress(selectedAddress: true),
            TSingleAddress(selectedAddress: false)
          ],
        ),
        ),
      ),
      
    );
  }
  
}