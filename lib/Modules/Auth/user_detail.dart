import 'package:ecommerce/Modules/Auth/Widget/custom_button.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_field.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Modules/Auth/auth_controller.dart';
import 'package:ecommerce/Routes/app_routes.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class UserDetail extends StatelessWidget {
  UserDetail({super.key});

  final AuthController authController = Get.put(AuthController());
  final TextEditingController genderController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        toolbarHeight: 10.h,
        leadingWidth: 20.w,
        leading: Container(
          margin: EdgeInsets.only(
            left: 8.w,
          ),
          padding: EdgeInsets.all(
            1.w,
          ),
          decoration: BoxDecoration(
            border: Border.all(color: ColorConstants.lightGrayColor, width: 1),
            shape: BoxShape.circle,
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
            left: 4.w,
            right: 4.w,
            bottom: 2.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3.h,
                ),
                const Align(
                  child: CustomText(
                    text: StringConstants.profiletext,
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
                    left: 8.w,
                    right: 8.w,
                  ),
                  child: const CustomText(
                    text: StringConstants.userdisplaytext,
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
                      Align(
                        child: GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => SizedBox(
                                height: 150,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: const Icon(Icons.photo_library),
                                      title: const Text('Gallery'),
                                      onTap: () {},
                                    ),
                                    ListTile(
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text('Camera'),
                                      onTap: () {},
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: 60,
                                backgroundColor: ColorConstants.background,
                                child: Align(
                                  alignment: Alignment.bottomRight,
                                  child: Container(
                                    height: 4.h,
                                    width: 8.w,
                                    decoration: BoxDecoration(
                                      color: ColorConstants.rich,
                                      borderRadius: BorderRadius.circular(100),
                                      border: Border.all(
                                        width: 2,
                                        color: ColorConstants.whiteColor,
                                      ),
                                    ),
                                    child: const Icon(
                                      AntDesign.edit_outline,
                                      color: ColorConstants.whiteColor,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.person_rounded,
                                color: ColorConstants.greyColor,
                                size: 60,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
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
                        height: 1.5.h,
                      ),
                      const CustomText(
                        text: StringConstants.phonelabel,
                        color: ColorConstants.blackColor,
                        fontSize: 11,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      // const CustomField(
                      //   hintText: StringConstants.phone,
                      //   fontSize: 11,
                      //   isPhoneNumber: true,
                      //   hintTextColor: ColorConstants.greyColor,
                      //   keyboardType: TextInputType.phone,
                      // ),
                      Obx(
                        () => CustomField(
                            hintText:
                                'Enter phone number', // Placeholder for phone input
                            fontSize: 11,
                            isPhoneNumber: true,
                            hintTextColor: ColorConstants.greyColor,
                            selectedCountryCode:
                                authController.selectedCountrycode.value,
                            countryCodes: authController.countryCode,
                            onCountryCodeChanged: (newValue) {
                              authController.setSelectedCountryCode(
                                  newValue); // Update country code
                            },
                            onChanged: (newValue) {
                              authController.setPhoneNumber(
                                  newValue); // Update phone number
                            },
                            controller: phoneController),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      const CustomText(
                        text: StringConstants.genderlabel,
                        color: ColorConstants.blackColor,
                        fontSize: 11,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 0.2.h,
                      ),
                      Obx(
                        () => CustomField(
                          hintText: StringConstants.gender,
                          fontSize: 11,
                          isDropdown: true,
                          hintTextColor: ColorConstants.greyColor,
                          genderdropdown: authController.genderDropdownValues,
                          onChanged: (newValue) {
                            authController.setSelectedDropdownItem(newValue);
                          },
                          controller: TextEditingController(
                            text: authController.selectedDropdownItem.value,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      CustomButton(
                        label: StringConstants.userBtntext,
                        btnColor: ColorConstants.rich,
                        height: 6.h,
                        fontSize: 14,
                        weight: FontWeight.w500,
                        action: () {
                          Get.toNamed(
                            AppRoutes.addressScreen,
                          );
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
