import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/widgets/rounded_containers/rounded_container.dart';
import 'package:makemyhome/features/shop/controllers/order_controller.dart';
import 'package:makemyhome/utils/helpers/cloud_helper_functions.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = CustomHelperFunctions.isDarkMode(context);

    return FutureBuilder(
      future: controller.fetchUseOrders(),
      builder: (_, snapshot) {
        final emptyWidget = Center(child: Text('Orders is Empty'));

        final response = CloudHelperFunctions.checkMUltiRecordState(snapshot: snapshot, nothingFound: emptyWidget);
        if (response != null) return response;

        final orders = snapshot.data!;
        return ListView.separated(
          separatorBuilder: (_, __) => const SizedBox(
            height: CustomSize.spaceBtwItem,
          ),
          itemCount: orders.length,
          itemBuilder: (_, index) {
            final order = orders[index];

            return TRoundedContainer(
            padding: EdgeInsets.all(CustomSize.md),
            showBorder: true,
            backgroundColor: dark ? CustomColor.black : CustomColor.white,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Icon(Iconsax.ship),
                        SizedBox(
                          width: CustomSize.spaceBtwItem / 2,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                order.orderStatusText,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .apply(
                                        color: CustomColor.yellow,
                                        fontWeightDelta: 1),
                              ),
                              Text(
                                order.formattedOrderDate,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                    IconButton(
                        onPressed: () {}, icon: Icon(Iconsax.arrow_right_34))
                  ],
                ),
                const SizedBox(
                  height: CustomSize.spaceBtwItem,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(
                          width: CustomSize.spaceBtwItem / 2,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Order',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                order.id,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                    Expanded(
                        child: Row(
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(
                          width: CustomSize.spaceBtwItem / 2,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping Date',
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Text(
                                order.formattedDeliveryDate,
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                  ],
                ),
              ],
            ),
          );
          } 
        );
      },
    );
  }
}
