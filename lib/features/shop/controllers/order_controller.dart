import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:makemyhome/common/widgets/success_screen/success_screen.dart';
import 'package:makemyhome/data/responsitories/authentication/authentication_responsitory.dart';
import 'package:makemyhome/data/responsitories/order/order_repository.dart';
import 'package:makemyhome/enums/enums.dart';
import 'package:makemyhome/features/personalization/controllers/address_controller.dart';
import 'package:makemyhome/features/shop/controllers/cart_controller.dart';
import 'package:makemyhome/features/shop/controllers/checkout_controller.dart';
import 'package:makemyhome/features/shop/models/order_model.dart';
import 'package:makemyhome/features/shop/screens/home/home.dart';
import 'package:makemyhome/navigation_menu.dart';
import 'package:makemyhome/utils/popups/loader.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  Future<List<OrderModel>> fetchUseOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    } catch (e) {
      TLoader.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  void processOrder(double totalAmount) async {
    try {
      final userId = AuthenticationRespository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      final order = OrderModel(
        id: UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        items: cartController.cartItems.toList(),
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        deliveryDate: DateTime.now(),
      );

      await orderRepository.saveOrder(order, userId);

      cartController.clearCart();

      Get.off(SuccessScreen(
          image: ImageString.lightAppLogo,
          title: 'Payment Success!',
          subTitle: 'Your items will be shipped soon',
          onPressed: () => Get.offAll(() => const NavigationMenu())));

      Get.offAll(const NavigationMenu());      
    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
