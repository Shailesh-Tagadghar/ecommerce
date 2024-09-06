import 'package:ecommerce/Modules/Auth/Widget/custom_button.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_field.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Modules/Auth/auth_controller.dart';
import 'package:ecommerce/Routes/app_routes.dart';
import 'package:ecommerce/Utils/Constants/asset_constant.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Signup extends StatelessWidget {
  Signup({super.key});

  final AuthController authController = Get.put(AuthController());

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: Padding(
        padding: EdgeInsets.only(
          top: 10.h,
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
                  text: StringConstants.createaccount,
                  color: ColorConstants.blackColor,
                  fontSize: 20,
                  weight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 1.5.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 12.w,
                  right: 12.w,
                ),
                child: const CustomText(
                  text: StringConstants.smalldisplay,
                  color: ColorConstants.greyColor,
                  fontSize: 12,
                  weight: FontWeight.w300,
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
                      text: StringConstants.namelabel,
                      color: ColorConstants.blackColor,
                      fontSize: 11,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 0.2.h,
                    ),
                    const CustomField(
                      hintText: StringConstants.name,
                      fontSize: 11,
                      hintTextColor: ColorConstants.greyColor,
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const CustomText(
                      text: StringConstants.emaillabel,
                      color: ColorConstants.blackColor,
                      fontSize: 11,
                      weight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 0.2.h,
                    ),
                    const CustomField(
                      hintText: StringConstants.email,
                      fontSize: 11,
                      hintTextColor: ColorConstants.greyColor,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
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
                        fontSize: 11,
                        showPasswordIcon: true,
                        hintText: StringConstants.password,
                        hintTextColor: ColorConstants.greyColor,
                        onIconPressed: authController.togglePasswordVisibility,
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Obx(
                          () => SizedBox(
                            height: 2.h,
                            width: 5.w,
                            child: Checkbox.adaptive(
                              value: authController.agreeToTerms.value,
                              onChanged: (bool? val) {
                                authController.agreeToTerms.value =
                                    !authController.agreeToTerms.value;
                              },
                              activeColor: ColorConstants.primary,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        const CustomText(
                          text: StringConstants.agree,
                          color: ColorConstants.blackColor,
                          fontSize: 12,
                          weight: FontWeight.w400,
                        ),
                        const CustomText(
                          text: StringConstants.tandc,
                          color: ColorConstants.rich,
                          weight: FontWeight.w500,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    CustomButton(
                      label: StringConstants.signUp,
                      btnColor: ColorConstants.rich,
                      height: 6.h,
                      fontSize: 14,
                      weight: FontWeight.w500,
                      action: () {
                        Get.toNamed(
                          AppRoutes.userDetailScreen,
                        );
                      },
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 0.05.h,
                          width: 20.w,
                          decoration: const BoxDecoration(
                            color: ColorConstants.greyColor,
                          ),
                        ),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        const CustomText(
                          text: StringConstants.diffsigninmethod2,
                          color: ColorConstants.greyColor,
                          fontSize: 10,
                          weight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: 2.5.w,
                        ),
                        Container(
                          height: 0.05.h,
                          width: 20.w,
                          decoration: const BoxDecoration(
                            color: ColorConstants.greyColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 3.w),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorConstants.lightGrayColor, width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(1),
                            icon: Image(
                              image: const AssetImage(
                                AssetConstant.appleLogo,
                              ),
                              width: 6.w,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3.w),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorConstants.lightGrayColor, width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(1),
                            iconSize: 24,
                            icon: Image(
                              image: const AssetImage(
                                AssetConstant.googleLogo,
                              ),
                              width: 6.w,
                            ),
                            onPressed: () {},
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 3.w),
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                                color: ColorConstants.lightGrayColor, width: 1),
                            shape: BoxShape.circle,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.all(1),
                            iconSize: 24,
                            icon: Image(
                              image: const AssetImage(
                                AssetConstant.faceBookLogo,
                              ),
                              width: 6.w,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.5.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CustomText(
                          text: StringConstants.account2,
                          color: ColorConstants.blackColor,
                          fontSize: 10,
                          weight: FontWeight.w400,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.signInScreen);
                          },
                          child: const CustomText(
                            text: StringConstants.signIn,
                            color: ColorConstants.rich,
                            fontSize: 12,
                            weight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
