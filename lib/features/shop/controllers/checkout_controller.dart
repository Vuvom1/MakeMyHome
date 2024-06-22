import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/common/widgets/texts/section_heading.dart';
import 'package:makemyhome/features/personalization/model/payment_model.dart';
import 'package:makemyhome/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod = PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value = PaymentMethodModel(name: 'Paypal', image: ImageString.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {

    return showModalBottomSheet(
      context: context, 
      builder: (_) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(CustomSize.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeading(title: 'Select Payment Method', showActionButton: false),
              const SizedBox(height: CustomSize.spaceBtwSections),
              PaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: ImageString.paypal)),
              const SizedBox(height: CustomSize.spaceBtwItem / 2),
              PaymentTile(paymentMethod: PaymentMethodModel(name: 'Cash', image: ImageString.cash)),


            ],
          ),
        ),
      ) 
      );
  }

}