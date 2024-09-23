import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class CategoryWidget extends StatelessWidget {
  final String image;
  final String name;

  const CategoryWidget({
    super.key,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
            color: ColorConstants.background,
            image: DecorationImage(
              image: AssetImage(image),
            ),
          ),
        ),
        SizedBox(
          height: 1.h,
        ),
        CustomText(
          text: name,
          color: ColorConstants.blackColor,
          weight: FontWeight.w600,
          fontSize: 11,
        )
      ],
    );
  }
}
