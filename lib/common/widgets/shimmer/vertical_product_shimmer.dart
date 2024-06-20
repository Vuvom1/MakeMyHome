
import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/layout/grid_layout.dart';
import 'package:makemyhome/common/widgets/shimmer/shimmer_effect.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class VerticalProductShimmer extends StatelessWidget {
  final int itemCount;

  const VerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
            width: 180,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              ShimmerEffect(width: 180, height: 180),
              SizedBox(height: CustomSize.spaceBtwItem),
              ShimmerEffect(width: 160, height: 15),
              SizedBox(height: CustomSize.spaceBtwItem / 2),
              ShimmerEffect(width: 110, height: 15),
            ])));
  }
}
