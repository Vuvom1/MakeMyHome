import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax/iconsax.dart';
import 'package:makemyhome/features/authentication/controllers/signup/signup_controller.dart';
import 'package:makemyhome/utils/themes/constants/colors.dart';
import 'package:makemyhome/utils/themes/constants/custom_size.dart';
import 'package:makemyhome/utils/themes/constants/text_strings.dart';
import 'package:makemyhome/utils/validators/vallidation.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(CustomSize.defaultSpace),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      TextString.signupTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: CustomSize.spaceBtwSections,
                    ),
                    Form(
                      key: controller.signupFormKey,
                        child: Column(
                      children: [
                        Row(children: [
                          Expanded(
                            child: TextFormField(
                              controller: controller.firstName,
                              validator: (value) =>
                                  TValidator.validateEmptyText(
                                      'First name', value),
                              expands: false,
                              decoration: const InputDecoration(
                                labelText: TextString.firstName,
                                prefix: Icon(Iconsax.user),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: CustomSize.spaceBtwItem,
                          ),
                          Expanded(
                            child: TextFormField(
                              validator: (value) =>
                                  TValidator.validateEmptyText(
                                      'Last name', value),
                              controller: controller.lastName,
                              expands: false,
                              decoration: const InputDecoration(
                                labelText: TextString.lastName,
                                prefix: Icon(Iconsax.user),
                              ),
                            ),
                          ),
                        ]),
                        const SizedBox(
                          height: CustomSize.spaceBtwInputFields,
                        ),
                        TextFormField(
                          controller: controller.username,
                          validator: (value) =>
                              TValidator.validateEmptyText('Username', value),
                          decoration: const InputDecoration(
                            labelText: TextString.username,
                            prefix: Icon(Iconsax.user_edit),
                          ),
                        ),
                        const SizedBox(
                          height: CustomSize.spaceBtwInputFields,
                        ),
                        TextFormField(
                          controller: controller.email,
                          validator: (value) => TValidator.validateEmail(value),
                          decoration: const InputDecoration(
                            labelText: TextString.email,
                            prefix: Icon(Iconsax.direct),
                          ),
                        ),
                        const SizedBox(
                          height: CustomSize.spaceBtwInputFields,
                        ),
                        TextFormField(
                          validator: (value) =>
                              TValidator.validatePhoneNumber(value),
                          controller: controller.phoneNumber,
                          decoration: const InputDecoration(
                            labelText: TextString.phoneNo,
                            prefix: Icon(Iconsax.call),
                          ),
                        ),
                        const SizedBox(
                          height: CustomSize.spaceBtwInputFields,
                        ),
                        Obx(
                          () => TextFormField(
                            validator: (value) =>
                                TValidator.validatePassword(value),
                            controller: controller.password,
                            obscureText: controller.hidePassword.value,
                            decoration: InputDecoration(
                                labelText: TextString.password,
                                prefix: Icon(Iconsax.password_check),
                                suffixIcon: IconButton(
                                    onPressed: () => controller.hidePassword
                                        .value = !controller.hidePassword.value,
                                    icon: controller.hidePassword.value
                                        ? const Icon(Iconsax.eye_slash)
                                        : const Icon(Iconsax.eye))),
                          ),
                        ),
                        const SizedBox(
                          height: CustomSize.spaceBtwSections,
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 24,
                              height: 24,
                              child: Obx(
                                () => Checkbox(
                                  value:  controller.privacyPolicy.value,
                                  onChanged: (value) => controller.privacyPolicy.value = !controller.privacyPolicy.value,
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: CustomSize.spaceBtwItem,
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: '${TextString.iAgreeTo}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: '${TextString.privacyPolicy}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      color: CustomColor.darkGrey,
                                      decoration: TextDecoration.underline,
                                      decorationColor: CustomColor.darkGrey,
                                    ),
                              ),
                              TextSpan(
                                text: '${TextString.and}',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextSpan(
                                text: '${TextString.termOfUse}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .apply(
                                      color: CustomColor.darkGrey,
                                      decoration: TextDecoration.underline,
                                      decorationColor: CustomColor.darkGrey,
                                    ),
                              ),
                            ]))
                          ],
                        ),
                        const SizedBox(
                          height: CustomSize.spaceBtwSections,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () => controller.signup(),
                            child: const Text(TextString.createAccount),
                          ),
                        )
                      ],
                    )),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
