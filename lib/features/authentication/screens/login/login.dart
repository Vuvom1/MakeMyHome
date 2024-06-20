import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/common/styles/spacing_styles.dart';
import 'package:makemyhome/features/authentication/login/login_controller.dart';
import 'package:makemyhome/features/authentication/screens/signup/widgets/signup.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/image_strings.dart';
import 'package:makemyhome/utils/themes/constants/text_strings.dart';
import 'package:makemyhome/utils/validators/vallidation.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
            padding: SpacingStyle.paddingWithAppBarHeight,
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      height: 150,
                      image: AssetImage(ImageString.lightAppLogo),
                    ),
                    SizedBox(height: CustomSize.spaceBtwSections,),
                    Text(
                      TextString.loginTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    )
                  ],
                ),
                Form(
                    key: controller.loginFormKey,
                    child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: CustomSize.spaceBtwSections),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: controller.email,
                        validator: (value) => TValidator.validateEmail(value),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Iconsax.direct_right),
                            labelText: TextString.email),
                      ),
                      const SizedBox(
                        height: CustomSize.spaceBtwInputFields / 2,
                      ),
                       Obx(
                          () => TextFormField(
                            validator: (value) =>
                                TValidator.validatePassword(value),
                            controller: controller.password,
                            obscureText: controller.hidePassword.value,
                            decoration: InputDecoration(
                                labelText: TextString.password,
                                prefixIcon: const Icon(Iconsax.password_check),
                                suffixIcon: IconButton(
                                    onPressed: () => controller.hidePassword
                                        .value = !controller.hidePassword.value,
                                    icon: controller.hidePassword.value
                                        ? const Icon(Iconsax.eye_slash)
                                        : const Icon(Iconsax.eye))),
                          ),
                        ),
                      const SizedBox(
                        height: CustomSize.spaceBtwInputFields / 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Obx(() => Checkbox(value: controller.rememberMe.value, onChanged: (value) => controller.rememberMe.value = !controller.rememberMe.value)) ,
                              const Text(TextString.rememberMe),
                            ],
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(TextString.fotgetPassword)),
                        ],
                      ),
                      const SizedBox(
                        height: CustomSize.spaceBtwSections,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () => controller.emailAndPasswordSignIn(),
                          child: const Text(TextString.signIn),
                        ),
                      ),
                      const SizedBox(
                        height: CustomSize.spaceBtwItem,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () => Get.to(() => const SignupScreen()), 
                          child: const Text(TextString.createAccount),
                          ),
                      ),
                    ],
                  ),
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Divider(
                      color: CustomColor.darkGrey,
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
