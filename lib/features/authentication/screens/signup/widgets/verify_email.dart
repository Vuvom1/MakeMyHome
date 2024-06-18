import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:makemyhome/common/widgets/success_screen/success_screen.dart';
import 'package:makemyhome/utils/helpers/helper_functions.dart';
import 'package:makemyhome/features/authentication/screens/login/login.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';
import 'package:makemyhome/utils/themes/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () => Get.offAll(() => const LoginScreen()), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(CustomSize.defaultSpace),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage(ImageString.lightAppLogoWithName), width: CustomHelperFunctions.screenWidth() * .6,),

              const SizedBox(height: CustomSize.spaceBtwSections,),

              Text(TextString.confirmEmail, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center,),

              const SizedBox(height: CustomSize.spaceBtwItem,),

              Text(TextString.confirmEmailSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),

              const SizedBox(height: CustomSize.spaceBtwSections,),

              SizedBox(
                width: double.infinity, 
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                    image: ImageString.lightAppLogo,
                    title: TextString.confirmEmail,
                    subTitle: TextString.confirmEmailSubTitle,
                    onPressed: () => Get.offAll(() => const LoginScreen()),
                  )), 
                  child: Text(TextString.TContinue),
                  ),
                ),

                 const SizedBox(height: CustomSize.spaceBtwItem,),

                 SizedBox(
                width: double.infinity, 
                child: OutlinedButton(
                  onPressed: (){}, 
                  child: Text(TextString.resendEmail),
                  ),
                ),



            ],
          ),
        ),
      ),
    );
  }
  
}