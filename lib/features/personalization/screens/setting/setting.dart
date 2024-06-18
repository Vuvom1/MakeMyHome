import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/common/widgets/custom_shapes/containers/primary_header.dart';
import 'package:makemyhome/common/widgets/images/circular_image.dart';
import 'package:makemyhome/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:makemyhome/common/widgets/list_tiles/user_profile_tile.dart';
import 'package:makemyhome/common/widgets/texts/section_heading.dart';
import 'package:makemyhome/features/personalization/screens/profile/profile.dart';
import 'package:makemyhome/features/shop/screens/address/address.dart';
import 'package:makemyhome/features/shop/screens/order/order.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
                child: Column(
              children: [
                TAppBar(
                  title: Text(
                    'Account',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .apply(color: CustomColor.textPrimary),
                  ),
                ),

                //User Profile Card
                UserProfileTile(
                  onTap: () => Get.to(() => const ProfileScreen()),
                ),

                // const SizedBox(
                //   height: CustomSize.spaceBtwSections,
                // ),
              ],
            )),
            Padding(
              padding: EdgeInsets.all(
                CustomSize.defaultSpace,
              ),
              child: Column(children: [
                const TSectionHeading(
                  title: 'Account Setting',
                  showActionButton: false,
                ),
                const SizedBox(
                  height: CustomSize.spaceBtwItem,
                ),
                SettingMenuTile(
                  icon: Iconsax.safe_home,
                  title: 'My Address',
                  subtitle: 'Set shopping dellivery address',
                  onTap: () => Get.to(() => UserAddressScreen()),
                ),
                SettingMenuTile(
                  icon: Iconsax.shopping_cart,
                  title: 'My Cart',
                  subtitle: 'Add, remove product and move to checkout',
                ),
                SettingMenuTile(
                  icon: Iconsax.bag_tick,
                  title: 'My Orders',
                  subtitle: 'In progress and completed orders',
                  onTap: () => Get.to(() => OrderScreen()),
                ),
                SettingMenuTile(
                  icon: Iconsax.bank,
                  title: 'Bank Account',
                  subtitle: 'Withdraw balance to register bank account',
                ),
                SettingMenuTile(
                  icon: Iconsax.discount_shape,
                  title: 'My Counpons ',
                  subtitle: 'Set any kind of notification message',
                ),
                SettingMenuTile(
                  icon: Iconsax.notification,
                  title: 'Notification',
                  subtitle: 'Set shopping dellivery address',
                ),
                SettingMenuTile(
                  icon: Iconsax.security_card,
                  title: 'Account Privacy',
                  subtitle: 'Manage data ussage and connected accounts',
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
