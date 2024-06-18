import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:makemyhome/features/authentication/screens/login/login.dart';
import 'package:makemyhome/features/authentication/screens/signup/widgets/verify_email.dart';
import 'package:makemyhome/navigation_menu.dart';
import 'package:makemyhome/utils/exceptions/firease_auth_exceception.dart';

class AuthenticationRespository extends StatelessWidget {
  static AuthenticationRespository get instance => Get.find();

  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;
  
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {

      if (user.emailVerified) {
        Get.offAll(NavigationMenu());
      } else {
        Get.offAll(NavigationMenu());
    }
    } else {
      deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true ? Get.offAll(() => const LoginScreen()) : Get.offAll(() => const LoginScreen());
    }

    
  }

  Future<UserCredential> loginWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      throw TFireaseAuthException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
  

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
     catch (e) {
      throw 'Something went wrong. Please try again.';
    }
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }


}