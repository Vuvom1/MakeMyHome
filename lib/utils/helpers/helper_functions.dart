import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CustomHelperFunctions {
  static void showSnackBar(String message) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  static void showAlert(String title, String message) {
    showDialog(
      context: Get.context!, 
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop, 
              child: const Text('OK'),
              )
          ],
        );
      });
  }

  static void navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context, 
      MaterialPageRoute(
        builder: (_) => screen
        )
    );
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Size screenSize() {
    return MediaQuery.of(Get.context!).size;
  }

  static double screenWidth() {
    return MediaQuery.of(Get.context!).size.width;
  }
}