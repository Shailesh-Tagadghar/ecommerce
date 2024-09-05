import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final void Function()? action;
  final Color? btnColor, textColor, iconColor;
  final double? width;
  final double? height;

  const CustomButton({
    super.key,
    required this.label,
    this.action,
    this.btnColor,
    this.textColor,
    this.iconColor,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? Get.height,
      width: width ?? Get.width,
      child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: WidgetStatePropertyAll(
              Size(Get.width, 40),
            ),
            maximumSize: WidgetStatePropertyAll(
              Size(Get.width, 40),
            ),
            backgroundColor:
                WidgetStatePropertyAll(btnColor ?? ColorConstants.primary),
          ),
          onPressed: action,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: ColorConstants.whiteColor,
                  fontSize: 11.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          )),
    );
  }
}
