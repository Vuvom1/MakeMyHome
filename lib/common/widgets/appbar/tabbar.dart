import 'package:flutter/material.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/device/device_utility.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> tabs;

  const TTabBar({super.key, required this.tabs});

  @override
  Widget build(BuildContext context) {
    final dark = CustomHelperFunctions.isDarkMode(context);

    return Material(
      color: dark ? CustomColor.black : CustomColor.primary,
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: CustomColor.primary,
        labelColor: dark ? CustomColor.white : CustomColor.black,
        unselectedLabelColor: CustomColor.darkGrey,
        tabAlignment: TabAlignment.start,
        indicator: UnderlineTabIndicator(
          borderSide: const BorderSide(width: 3.0, color: CustomColor.yellow),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(DeviceUtility.getAppBarHeight());
  
}