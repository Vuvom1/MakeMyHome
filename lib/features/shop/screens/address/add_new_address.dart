import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/features/shop/screens/address/address.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Add new Address'),),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSize.defaultSpace),
          child: Form(child: Column(
            children: [
              TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.user), labelText: 'Name' ),),
              const SizedBox(height: CustomSize.spaceBtwInputFields,),
              TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone number' ),),
              const SizedBox(height: CustomSize.spaceBtwInputFields,),
              Row(
                children: [
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building_31), labelText: 'Street' ),)),
                  const SizedBox(width: CustomSize.spaceBtwInputFields,),
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.code), labelText: 'Postal Code' ),))
                ],
              ),

                const SizedBox(height: CustomSize.spaceBtwInputFields,),

               Row(
                children: [
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.building), labelText: 'City' ),)),
                  const SizedBox(width: CustomSize.spaceBtwInputFields,),
                  Expanded(child: TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.activity), labelText: 'State' ),)),
                ],
              ),

              const SizedBox(height: CustomSize.spaceBtwInputFields,),
              TextFormField(decoration: InputDecoration(prefixIcon: Icon(Iconsax.mobile), labelText: 'Phone number' ),),
              const SizedBox(height: CustomSize.spaceBtwInputFields,),
              SizedBox(width: double.infinity, child: ElevatedButton(child: Text('Save'), onPressed:  () => Get.to(() => const UserAddressScreen())),),

              
            ],
          )),
        ),
        
      ),
    );

  }
  
}