import 'package:flutter/material.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CustomColor.primary,
      child: SizedBox(
        // height: 200,
        child: Container(
          color: CustomColor.primary,
          child: Stack(
            children: [
              child,
            ],
          ),
        ),
      )
    );
  }
}
