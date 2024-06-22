import 'package:get/get.dart';
import 'package:makemyhome/features/personalization/controllers/address_controller.dart';
import 'package:makemyhome/features/shop/controllers/cart_controller.dart';
import 'package:makemyhome/features/shop/controllers/checkout_controller.dart';
import 'package:makemyhome/features/shop/controllers/variation_controller.dart';
import 'package:makemyhome/utils/network/network_manager.dart';

class GeneralBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
    Get.put(AddressController());
    Get.put(CheckoutController());
   
  }
}