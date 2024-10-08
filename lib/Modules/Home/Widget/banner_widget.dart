import 'package:ecommerce/Modules/Auth/Widget/custom_button.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Utils/Constants/api_constants.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BannerWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;

  const BannerWidget({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 1.w),
        decoration: BoxDecoration(
          // image: DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
          image: DecorationImage(
              image: NetworkImage('${ApiConstants.imageBaseUrl}$image'),
              fit: BoxFit.fill),
          borderRadius: BorderRadius.circular(10),
          color: ColorConstants.lightGrayColor,
        ),
        child: Padding(
          padding: EdgeInsets.only(
            left: 5.w,
            top: 2.h,
            bottom: 1.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 40.w,
                child: CustomText(
                  text: title,
                  color: ColorConstants.blackColor,
                  weight: FontWeight.w600,
                  fontSize: 11,
                ),
              ),
              // SizedBox(height: 4),
              SizedBox(
                width: 37.w,
                child: CustomText(
                  text: subtitle,
                  color: ColorConstants.greyColor,
                  weight: FontWeight.w500,
                  fontSize: 11,
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              CustomButton(
                label: StringConstants.shopnowBtn,
                isSelected: true,
                btnColor: ColorConstants.primary,
                height: 4.h,
                width: 27.w,
                weight: FontWeight.w500,
                fontSize: 9,
              ),
            ],
          ),
        ));
  }
}
