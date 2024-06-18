import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:makemyhome/binding/general_binding.dart';
import 'package:makemyhome/data/responsitories/authentication/authentication_responsitory.dart';
import 'package:makemyhome/features/authentication/screens/login/login.dart';
import 'package:makemyhome/firebase_options.dart';
import 'package:makemyhome/utils/themes/theme.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized(); 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((FirebaseApp value) => Get.put(AuthenticationRespository()),);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Make My Home',
      theme: AppTheme.lightTheme,
      initialBinding: GeneralBinding(),
      home: const LoginScreen(),
    );
  }
}
