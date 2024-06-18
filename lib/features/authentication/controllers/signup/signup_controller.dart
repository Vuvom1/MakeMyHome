import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/data/responsitories/authentication/authentication_responsitory.dart';
import 'package:makemyhome/data/responsitories/user/user_responsitory.dart';
import 'package:makemyhome/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:makemyhome/features/personalization/model/user_model.dart';
import 'package:makemyhome/utils/popups/loader.dart';
import 'package:makemyhome/utils/network/network_manager.dart';
import 'package:makemyhome/utils/popups/full_screen_loader.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  Future<void> signup() async {
    try {
      TFullScreenLoader.openLoadingDialog('We are processing your information...', ImageString.lightAppLogo);

    final isConnected = await NetworkManager.instance.isConnected();
    if (!isConnected ) {
      TFullScreenLoader.stopLoading();
      return;
    }

    if (!signupFormKey.currentState!.validate()) return;

    if (!privacyPolicy.value) {
      TLoader.warningSnackBar(title: 'Accept Privacy Policy',
      message: 'In order to create account, you must to read and accept the Privacy Policy and Term of Use');
    }

    final userCredential = await AuthenticationRespository.instance.registerWithEmailAndPassword(email.text.trim(), password.text.trim());

    final newUser = UserModel(
      id: userCredential.user!.uid,
      firstName: firstName.text.trim(),
      lastName: lastName.text.trim(),
      username: username.text.trim(),
      email: email.text.trim(),
      phoneNumber: phoneNumber.text.trim(),
      profilePicture: '',
    );

    final userResponsitory = Get.put(UserResponsitory());
    await userResponsitory.saveUserRecord(newUser);

    TLoader.successSnackBar(title: 'Congratulations', message: 'Your account has been created! Verify email to continue');

    Get.to(() => const VerifyEmailScreen());

    } catch (e) {
      TLoader.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      TFullScreenLoader.stopLoading();
    }
    
  } 
}
