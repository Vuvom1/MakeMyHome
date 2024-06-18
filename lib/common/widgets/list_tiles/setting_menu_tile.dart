import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';

class SettingMenuTile extends StatelessWidget {
  final IconData icon;
  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;

  const SettingMenuTile({
    super.key, 
    required this.icon, 
    required this.title, 
    required this.subtitle, 
    this.trailing, 
    this.onTap,
    });

  @override
  Widget build(BuildContext context) {
    return ListTile(
     leading: Icon(icon, size: 28, color:  CustomColor.textPrimary,),
     title: Text(title, style: Theme.of(context).textTheme.titleMedium,),
      subtitle: Text(subtitle, style: Theme.of(context).textTheme.labelMedium,),
      onTap: onTap,

    );
  }
  
}