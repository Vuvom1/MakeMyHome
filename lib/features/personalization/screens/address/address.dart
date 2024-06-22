import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/features/personalization/controllers/address_controller.dart';
import 'package:makemyhome/features/personalization/screens/address/add_new_address.dart';
import 'package:makemyhome/features/personalization/screens/address/widgets/single_address.dart';
import 'package:makemyhome/utils/helpers/cloud_helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: CustomColor.black,
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(
          Iconsax.add,
          color: CustomColor.white,
        ),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: EdgeInsets.all(CustomSize.defaultSpace),
            child: Obx(
              () => FutureBuilder(
                  key: Key(controller.refreshData.value.toString()),
                  future: controller.getAllUserAddresses(),
                  builder: (context, snapshot) {
                    final response = CloudHelperFunctions.checkMUltiRecordState(
                        snapshot: snapshot);
                    if (response != null) return response;

                    final addresses = snapshot.data!;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: addresses.length,
                      itemBuilder: (_, index) => TSingleAddress(
                        address: addresses[index],
                        onTap: () =>
                            controller.selectedAddress(addresses[index]),
                      ),
                    );
                  }),
            )),
      ),
    );
  }
}
