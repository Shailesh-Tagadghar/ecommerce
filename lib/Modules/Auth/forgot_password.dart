import 'package:ecommerce/Modules/Auth/Widget/custom_button.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_field.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Modules/Auth/auth_controller.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cnfpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        toolbarHeight: 10.h,
        leadingWidth: 15.w,
        leading: Container(
          alignment: Alignment.centerLeft,
          margin: EdgeInsets.only(
            left: 4.w,
          ),
          padding: EdgeInsets.all(
            0.6.w,
          ),
          child: IconButton(
            iconSize: 24,
            icon: const Icon(
              Bootstrap.arrow_left,
              color: ColorConstants.blackColor,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
      ),
      body: Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        body: Padding(
          padding: EdgeInsets.only(
            top: 2.h,
            left: 4.w,
            right: 4.w,
            bottom: 2.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  child: CustomText(
                    text: StringConstants.newPass,
                    color: ColorConstants.blackColor,
                    fontSize: 18,
                    weight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 12.w,
                    right: 12.w,
                  ),
                  child: const CustomText(
                    text: StringConstants.forgotdisplaytext,
                    color: ColorConstants.greyColor,
                    fontSize: 11,
                    weight: FontWeight.w400,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 4.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: StringConstants.passwordlabel,
                        color: ColorConstants.blackColor,
                        fontSize: 11,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      Obx(
                        () => CustomField(
                          controller: passwordController,
                          obscureText: authController.isPasswordVisible.value,
                          obscuringCharacter: '*',
                          showPasswordIcon: true,
                          hintText: StringConstants.password,
                          fontSize: 11,
                          hintTextColor: ColorConstants.greyColor,
                          onIconPressed:
                              authController.togglePasswordVisibility,
                        ),
                      ),
                      Obx(() => authController.passwordError.isNotEmpty
                          ? CustomText(
                              text: authController.passwordError.value,
                              color: Colors.red,
                              fontSize: 10,
                              weight: FontWeight.w400,
                            )
                          : Container()),
                      SizedBox(
                        height: 2.h,
                      ),
                      const CustomText(
                        text: StringConstants.cnfpasswordlabel,
                        color: ColorConstants.blackColor,
                        fontSize: 11,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      Obx(
                        () => CustomField(
                          controller: cnfpasswordController,
                          obscureText:
                              authController.isCnfPasswordVisible.value,
                          obscuringCharacter: '*',
                          showPasswordIcon: true,
                          hintText: StringConstants.password,
                          fontSize: 11,
                          hintTextColor: ColorConstants.greyColor,
                          onIconPressed:
                              authController.toggleCnfPasswordVisibility,
                        ),
                      ),
                      Obx(() => authController.confirmPasswordError.isNotEmpty
                          ? CustomText(
                              text: authController.confirmPasswordError.value,
                              color: Colors.red,
                              fontSize: 10,
                              weight: FontWeight.w400,
                            )
                          : Container()),
                      SizedBox(
                        height: 5.h,
                      ),
                      CustomButton(
                        label: StringConstants.btntext,
                        btnColor: ColorConstants.rich,
                        height: 6.h,
                        fontSize: 14,
                        weight: FontWeight.w500,
                        action: () {
                          // authController
                          //     .validatePassword(passwordController.text);
                          // authController.validateConfirmPassword(
                          //   passwordController.text,
                          //   cnfpasswordController.text,
                          // );

                          // if (authController.passwordError.value.isEmpty &&
                          //     authController
                          //         .confirmPasswordError.value.isEmpty) {
                          //   // Handle password change
                          //   print('Passwords are valid and match.');

                          //   // Call the method to save new password here
                          // }
                          // Retrieve passwords from controllers
                          String password = passwordController.text;
                          String confirmPassword = cnfpasswordController.text;

                          // Validate the passwords
                          authController.validatePassword(password);
                          authController.validateConfirmPassword(
                              password, confirmPassword);

                          if (authController.passwordError.isEmpty &&
                              authController.confirmPasswordError.isEmpty) {
                            // Store and print the new password
                            authController.saveNewPassword(password);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
