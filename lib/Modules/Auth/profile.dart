import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Routes/app_routes.dart';
import 'package:ecommerce/Utils/Constants/asset_constant.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConstants.whiteColor,
        appBar: AppBar(
          backgroundColor: ColorConstants.whiteColor,
          toolbarHeight: 10.h,
          leadingWidth: 15.w,
          title: const CustomText(
            text: StringConstants.profile,
            weight: FontWeight.w500,
            fontSize: 13,
          ),
          centerTitle: true,
          leading: Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(
              left: 4.w,
            ),
            padding: EdgeInsets.all(
              0.6.w,
            ),
            decoration: BoxDecoration(
              border:
                  Border.all(color: ColorConstants.lightGrayColor, width: 1),
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
        body: Padding(
          padding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            bottom: 2.h,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                          backgroundImage: const AssetImage(AssetConstant.pd1),
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
                        // const Icon(
                        //   Icons.person_rounded,
                        //   color: ColorConstants.greyColor,
                        //   size: 60,
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                const CustomText(
                  text: StringConstants.profileName,
                  color: ColorConstants.blackColor,
                  fontSize: 14,
                  weight: FontWeight.w500,
                ),
                SizedBox(
                  height: 2.h,
                ),

                //1st Row
                GestureDetector(
                  onTap: () {
                    Get.toNamed(
                      AppRoutes.userDetailScreen,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Bootstrap.person,
                            color: ColorConstants.rich,
                            size: 30,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          const CustomText(
                            text: StringConstants.row1,
                            color: ColorConstants.blackColor,
                            fontSize: 14,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ColorConstants.rich,
                        size: 24,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(
                  color: ColorConstants.background,
                  height: 1.h,
                  thickness: 1,
                ),
                SizedBox(
                  height: 1.5.h,
                ),

                //2nd Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Bootstrap.credit_card,
                          color: ColorConstants.rich,
                          size: 30,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        const CustomText(
                          text: StringConstants.row2,
                          color: ColorConstants.blackColor,
                          fontSize: 14,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorConstants.rich,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(
                  color: ColorConstants.background,
                  height: 1.h,
                  thickness: 1,
                ),
                SizedBox(
                  height: 1.5.h,
                ),

                //3rd Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.shopping_bag_outlined,
                          color: ColorConstants.rich,
                          size: 30,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        const CustomText(
                          text: StringConstants.row3,
                          color: ColorConstants.blackColor,
                          fontSize: 14,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorConstants.rich,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(
                  color: ColorConstants.background,
                  height: 1.h,
                  thickness: 1,
                ),
                SizedBox(
                  height: 1.5.h,
                ),

                //4th Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.settings_outlined,
                          color: ColorConstants.rich,
                          size: 30,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        const CustomText(
                          text: StringConstants.row4,
                          color: ColorConstants.blackColor,
                          fontSize: 14,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorConstants.rich,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(
                  color: ColorConstants.background,
                  height: 1.h,
                  thickness: 1,
                ),
                SizedBox(
                  height: 1.5.h,
                ),

                //5th Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.info_outline_rounded,
                          color: ColorConstants.rich,
                          size: 30,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        const CustomText(
                          text: StringConstants.row5,
                          color: ColorConstants.blackColor,
                          fontSize: 14,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorConstants.rich,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(
                  color: ColorConstants.background,
                  height: 1.h,
                  thickness: 1,
                ),
                SizedBox(
                  height: 1.5.h,
                ),

                //6th Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.lock_outline_rounded,
                          color: ColorConstants.rich,
                          size: 30,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        const CustomText(
                          text: StringConstants.row6,
                          color: ColorConstants.blackColor,
                          fontSize: 14,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorConstants.rich,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(
                  color: ColorConstants.background,
                  height: 1.h,
                  thickness: 1,
                ),
                SizedBox(
                  height: 1.5.h,
                ),

                //7th Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Bootstrap.person_add,
                          color: ColorConstants.rich,
                          size: 30,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        const CustomText(
                          text: StringConstants.row7,
                          color: ColorConstants.blackColor,
                          fontSize: 14,
                          weight: FontWeight.w400,
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorConstants.rich,
                      size: 24,
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Divider(
                  color: ColorConstants.background,
                  height: 1.h,
                  thickness: 1,
                ),
                SizedBox(
                  height: 1.5.h,
                ),

                //8th Row -- LOgout
                GestureDetector(
                  onTap: () {
                    // _showLogoutDialog(context);
                    _showLogoutBottomSheet(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.logout_outlined,
                            color: ColorConstants.rich,
                            size: 30,
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          const CustomText(
                            text: StringConstants.logout,
                            color: ColorConstants.blackColor,
                            fontSize: 14,
                            weight: FontWeight.w400,
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: ColorConstants.rich,
                        size: 24,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
              ],
            ),
          ),
        ));
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorConstants.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(22.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Column(
                  children: [
                    Divider(
                      color: ColorConstants.background,
                      thickness: 4,
                      endIndent: 30.w,
                      indent: 30.w,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const CustomText(
                      text: StringConstants.logout1,
                      fontSize: 16,
                      weight: FontWeight.w500,
                      color: ColorConstants.blackColor,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Divider(
                      color: ColorConstants.background,
                      height: 1.h,
                      thickness: 2,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              const CustomText(
                text: StringConstants.confirm,
                color: ColorConstants.greyColor,
                fontSize: 14,
                textAlign: TextAlign.center,
                weight: FontWeight.w400,
              ),
              SizedBox(
                height: 4.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 6.h,
                    width: 40.w,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: ColorConstants.rich,
                        width: 2,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.whiteColor,
                      ),
                      child: const CustomText(
                        text: StringConstants.cancel,
                        color: ColorConstants.rich,
                        fontSize: 14,
                        weight: FontWeight.w500,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Container(
                    height: 6.h,
                    width: 40.w,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorConstants.rich,
                      ),
                      child: const CustomText(
                        text: StringConstants.confirmLogout,
                        color: ColorConstants.whiteColor,
                        fontSize: 14,
                        weight: FontWeight.w500,
                      ),
                      onPressed: () {
                        Get.offAllNamed(AppRoutes.signInScreen);
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 4.h, // Add some space at the bottom
              ),
            ],
          ),
        );
      },
    );
  }
}
