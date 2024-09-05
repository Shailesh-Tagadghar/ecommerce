import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomField extends StatelessWidget {
  final String? hintText;
  final Color? hintTextColor;
  final TextInputType keyboardType;
  final bool obscureText;
  final String obscuringCharacter;
  final bool showPasswordIcon;
  final VoidCallback? onIconPressed;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  CustomField({
    super.key,
    this.hintText,
    this.hintTextColor = ColorConstants.greyColor,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.obscuringCharacter = '*',
    this.showPasswordIcon = false,
    this.onIconPressed,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      obscuringCharacter: obscuringCharacter,
      controller: controller,
      onChanged: onChanged,
      // cursorRadius: const Radius.circular(8),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          left: 4.w,
          right: 4.w,
          bottom: 1.h,
          top: 1.h,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: hintTextColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        suffixIcon: showPasswordIcon
            ? IconButton(
                icon: Icon(
                  obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: onIconPressed,
              )
            : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: ColorConstants.lightGrayColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: ColorConstants.lightGrayColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(
            color: ColorConstants.errorColor,
          ),
        ),
      ),
    );
  }
}
