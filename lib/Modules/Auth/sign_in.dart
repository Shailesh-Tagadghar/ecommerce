import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Align(
                child: CustomText(
                  text: StringConstants.createaccount,
                  color: ColorConstants.blackColor,
                  fontSize: 18,
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
                  fontSize: 11,
                  weight: FontWeight.w300,
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
