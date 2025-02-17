import 'package:app/screens/auth/login.dart';
import 'package:app/shareds/utils/app_colors.dart';
import 'package:app/widgets/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../controllers/sign_up_individual_controller.dart';
import '../../widgets/overlay_indeterminate_progress.dart';
import '../../widgets/password_strength_bar.dart';
import '../../widgets/standard_button.dart';
import '../../widgets/text_form_input.dart';

class SignUpScreenIndividual extends StatelessWidget {
  SignUpScreenIndividual({super.key});
  final controller = Get.put(SignUpIndividualController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => OverlayIndeterminateProgress(
        isLoading: controller.isLoaded.value,
        overlayBackgroundColor: background,
        progressColor: primaryColor,
        child: GestureDetector(
          onTap: () => Get.focusScope!.unfocus(),
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: background,
            appBar: AppBar(
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarColor: primaryColor,
                statusBarBrightness: Brightness.light, // For iOS
                statusBarIconBrightness: Brightness.light, // For Android
                systemNavigationBarColor: navigationBarBackground,
                systemNavigationBarIconBrightness: Brightness.light,
              ),
              backgroundColor: background,
              elevation: 0.0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 5, right: 20, left: 20, bottom: 20),
                child: Column(
                  children: [
                    Text(
                      'Let\'s Get Started!',
                      style: appStyles(24, null, FontWeight.w600),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Create an account with Trowpass',
                      style: appStyles(16, Colors.black, FontWeight.w400),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Please Note: SMS will not be delivered to a Do Not Disturb (DND) number.',
                      style: appStyles(16, Colors.black, FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 22),
                    Form(
                        key: controller.formKey,
                        child: Column(
                          children: [
                            TextInputForm(
                              enabled: true,
                              inputController: controller.firstNameController,
                              textHint: 'First Name',
                              validatorMessage: 'Please enter first name',
                              isPassword: false,
                              autoCorrect: false,
                              prefixIcon: const Icon(
                                Icons.person_outline_outlined,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextInputForm(
                              enabled: true,
                              inputController: controller.lastNameController,
                              textHint: 'Last Name',
                              validatorMessage: 'Please enter last name',
                              isPassword: false,
                              autoCorrect: false,
                              prefixIcon: const Icon(
                                Icons.person_outline_outlined,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextInputForm(
                              inputType: TextInputType.emailAddress,
                              enabled: true,
                              inputController: controller.emailController,
                              textHint: 'Email',
                              validatorMessage: 'Please enter your email',
                              isPassword: false,
                              autoCorrect: false,
                              prefixIcon: const Icon(
                                Icons.email,
                                size: 22,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextInputForm(
                              inputType: TextInputType.phone,
                              enabled: true,
                              inputController: controller.phoneNumberController,
                              textHint: 'Phone Number',
                              validatorMessage: 'Please enter a valid number',
                              isPassword: false,
                              autoCorrect: false,
                              prefixIcon: const Icon(
                                Icons.phone_android,
                                size: 24,
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextInputForm(
                              enabled: true,
                              inputController: controller.passwordController,
                              textHint: 'Password',
                              isPassword: controller.isPasswordHidden.value,
                              autoCorrect: false,
                              prefixIcon: const Icon(
                                Icons.lock_clock_rounded,
                                size: 24,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isPasswordHidden.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: controller.isFocused.value
                                      ? primaryColor
                                      : null,
                                  size: 24,
                                ),
                                onPressed: () => controller.isPasswordHidden
                                    .value = !controller.isPasswordHidden.value,
                              ),
                              onChanged: (value) =>
                                  controller.checkPassword(value),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              child: Obx(() => PasswordStrengthBar(
                                  strength: controller.strength.value)),
                            ),
                            TextInputForm(
                              enabled: true,
                              inputController:
                                  controller.confirmPasswordController,
                              textHint: 'Confirm password',
                              validatorMessage: 'Password do not match',
                              validator: (value) =>
                                  controller.passwordController.text != value
                                      ? 'Password do not match'
                                      : null,
                              isPassword:
                                  controller.isComfirmPasswordHidden.value,
                              autoCorrect: false,
                              prefixIcon: const Icon(
                                Icons.lock,
                                size: 24,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  controller.isComfirmPasswordHidden.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: controller.isFocused.value
                                      ? primaryColor
                                      : null,
                                  size: 24,
                                ),
                                onPressed: () => controller
                                        .isComfirmPasswordHidden.value =
                                    !controller.isComfirmPasswordHidden.value,
                              ),
                            ),
                            const SizedBox(height: 20),
                            StandardButton(
                              text: 'SIGN UP',
                              onPressed: () => controller.proceedRegister(),
                            ),
                          ],
                        )),
                    const SizedBox(height: 32),
                    Text(
                      'Already have an account?',
                      style: appStyles(
                        14,
                        grayscale,
                        FontWeight.w600,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.to(() => LoginScreen());
                      },
                      child: Text(
                        'Login here',
                        style: appStyles(
                          14,
                          primaryColor,
                          FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )));
  }
}
