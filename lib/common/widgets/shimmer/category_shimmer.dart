import 'package:flutter/cupertino.dart';
import 'package:makemyhome/common/widgets/shimmer/shimmer_effect.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class CategoryShimmer extends StatelessWidget {
  final int itemCount;

  const CategoryShimmer({
    super.key,
    this.itemCount = 6,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) => const SizedBox(width: CustomSize.spaceBtwItem),
          itemCount: itemCount,
          itemBuilder: (_, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerEffect(width: 55, height: 55, radius: 55,),
                SizedBox(height: CustomSize.spaceBtwItem / 2,),

                ShimmerEffect(width: 55, height: 8),
              ],
            );
          },
      )
    );
  }
}
