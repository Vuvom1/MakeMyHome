import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:makemyhome/common/widgets/appbar/appbar.dart';
import 'package:makemyhome/features/shop/screens/order/widgets/order_list.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall,),
        showBackArrow: true,
      ),

      body: Padding(
        padding: EdgeInsets.all(CustomSize.defaultSpace),
        child: OrderListItems(),
      ),
    );
  }
  
}