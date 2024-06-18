import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/images/circular_image.dart';
import 'package:makemyhome/common/widgets/shimmer/shimmer_effect.dart';
import 'package:makemyhome/common/widgets/texts/section_heading.dart';
import 'package:makemyhome/features/personalization/controllers/user_controller.dart';
import 'package:makemyhome/features/personalization/screens/change_name/change_name.dart';
import 'package:makemyhome/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CustomSize.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImagge = controller.user.value.profilePicture;
                      final image = networkImagge.isNotEmpty ? networkImagge : ImageString.defaultUserImage;
                      return controller.imageUploading.value ? ShimmerEffect(width: 80, height: 80, radius: 80,) : TCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImagge.isNotEmpty,);
                    }),
                    
                    TextButton(
                        onPressed: () => controller.uploadProfilePicture(),
                        child: const Text('Change Profile Picture')),
                  ],
                ),
              ),
              const SizedBox(
                height: CustomSize.spaceBtwItem / 2,
              ),
              const Divider(),
              const SizedBox(
                height: CustomSize.spaceBtwItem,
              ),
              TSectionHeading(
                title: 'Profile Infomation',
                showActionButton: false,
              ),
              const SizedBox(
                height: CustomSize.spaceBtwItem,
              ),
              ProfileMenu(onPressed: () => Get.to(() => const ChangeName()), title: 'Name', value: controller.user.value.fullName),
              ProfileMenu(
                  onPressed: () {}, title: 'Username', value: controller.user.value.username),
              const Divider(),
              const SizedBox(
                height: CustomSize.spaceBtwItem,
              ),
              TSectionHeading(
                title: 'Profile Infomation',
                showActionButton: false,
              ),
              const SizedBox(
                height: CustomSize.spaceBtwItem,
              ),
              ProfileMenu(onPressed: () {}, title: 'User ID', value: controller.user.value.id, icon: Iconsax.copy,),
              ProfileMenu(onPressed: () {}, title: 'Email', value: controller.user.value.email),
              ProfileMenu(onPressed: () {}, title: 'Phone number', value: controller.user.value.phoneNumber),
              ProfileMenu(onPressed: () {}, title: 'Gender', value: 'Male'),
              ProfileMenu(onPressed: () {}, title: 'Date of Birth', value: 'April 11, 2003'),

              Divider(),

              const SizedBox(height: CustomSize.spaceBtwItem,),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Close Account' ,style: TextStyle(color: Colors.red),),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
