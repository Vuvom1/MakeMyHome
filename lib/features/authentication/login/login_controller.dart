import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:makemyhome/data/responsitories/authentication/authentication_responsitory.dart';
import 'package:makemyhome/utils/popups/full_screen_loader.dart';
import 'package:makemyhome/utils/popups/loader.dart';

class LoginController extends GetxController {
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    if (localStorage.read('REMEMBER_ME_EMAIL') != null && localStorage.read('REMEMBER_ME_PASSWORD') != null) {
      email.text = localStorage.read('REMEMBER_ME_EMAIL');
      password.text = localStorage.read('REMEMBER_ME_PASSWORD');
    }
    super.onInit();
  }

  Future<void> emailAndPasswordSignIn() async {
    try {
      // TFullScreenLoader.openLoadingDialog('Logging you in', ImageString.lightAppLogo);

      // final isConnected = await NetworkManager.instance.isConnected();

      // if (!isConnected) {
      //   TFullScreenLoader.stopLoading();
      //   return;
      // }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (rememberMe.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      final userCredentials = await AuthenticationRespository.instance.loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // TFullScreenLoader.stopLoading();

      AuthenticationRespository.instance.screenRedirect();
    } catch (e) {
      // TFullScreenLoader.stopLoading();
      TLoader.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

}