import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/data/responsitories/user/user_responsitory.dart';
import 'package:makemyhome/features/personalization/controllers/user_controller.dart';
import 'package:makemyhome/features/personalization/screens/profile/profile.dart';
import 'package:makemyhome/utils/network/network_manager.dart';
import 'package:makemyhome/utils/popups/loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userResponsitory = Get.put(UserResponsitory());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    initializeName();
    super.onInit();
  }

  Future<void> initializeName() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }

  Future<void> updateUserName() async {
    try {
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        return;
      }

      if (!updateUserNameFormKey.currentState!.validate()) {
        return;
      }

      Map<String, dynamic> name = {'FirstName': firstName.text.trim(), 'LastName': lastName.text.trim()};
      await userResponsitory.updateSingleField(name);

      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      TLoader.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated. ');

     Get.off(() => const ProfileScreen()); 

    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}