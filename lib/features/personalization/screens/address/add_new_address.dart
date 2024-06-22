import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/features/personalization/controllers/address_controller.dart';
import 'package:makemyhome/features/personalization/screens/address/address.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/validators/vallidation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSize.defaultSpace),
          child: Form(
              key: controller.addressFormkey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        TValidator.validateEmptyText('Name', value),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
                  ),
                  const SizedBox(
                    height: CustomSize.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.phoneNumber,
                    validator: (value) => TValidator.validatePhoneNumber(value),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: 'Phone number'),
                  ),
                  const SizedBox(
                    height: CustomSize.spaceBtwInputFields,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        controller: controller.street,
                        validator: (value) =>
                            TValidator.validateEmptyText('Street', value),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.building_31),
                            labelText: 'Street'),
                      )),
                      const SizedBox(
                        width: CustomSize.spaceBtwInputFields,
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) =>
                            TValidator.validateEmptyText('Postal Code', value),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.code),
                            labelText: 'Postal Code'),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: CustomSize.spaceBtwInputFields,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            TValidator.validateEmptyText('City', value),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.building),
                            labelText: 'City'),
                      )),
                      const SizedBox(
                        width: CustomSize.spaceBtwInputFields,
                      ),
                      Expanded(
                          child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            TValidator.validateEmptyText('State', value),
                        decoration: InputDecoration(
                            prefixIcon: Icon(Iconsax.activity),
                            labelText: 'State'),
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: CustomSize.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.country,
                    validator: (value) =>
                        TValidator.validateEmptyText('Country', value),
                    decoration: InputDecoration(
                        prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                  ),
                  const SizedBox(
                    height: CustomSize.spaceBtwInputFields,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        child: Text('Save'),
                        onPressed: () => controller.addNewAddress() ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
