import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/images/circular_image.dart';
import 'package:makemyhome/features/personalization/controllers/user_controller.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class UserProfileTile extends StatelessWidget {
  const UserProfileTile({super.key, this.onTap});
  
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      leading: Obx(() {
                      final networkImagge = controller.user.value.profilePicture;
                      final image = networkImagge.isNotEmpty ? networkImagge : ImageString.defaultUserImage;
                      return  TCircularImage(
                        image: image,
                        width: 80,
                        height: 80,
                        isNetworkImage: networkImagge.isNotEmpty,);
                    }),
      title: Text(
        controller.user.value.fullName,
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: CustomColor.textPrimary),
      ),
      subtitle: Text(
        controller.user.value.email,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .apply(color: CustomColor.textPrimary),
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: const Icon(Iconsax.edit),
        color: CustomColor.textPrimary,
      ),
    );
  }
}
