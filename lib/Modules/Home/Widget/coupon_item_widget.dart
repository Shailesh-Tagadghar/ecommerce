import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Utils/Constants/asset_constant.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CouponItemWidget extends StatelessWidget {
  final String code;
  final String description;
  final String offertext;
  final String copy;

  const CouponItemWidget({
    super.key,
    required this.code,
    required this.description,
    required this.offertext,
    required this.copy,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: 1.5.w,
        right: 1.5.w,
        top: 0.2.h,
      ),
      child: Column(
        children: [
          Container(
            height: 20.15.h,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                color: ColorConstants.lightGrayColor,
                // width: 0.3,
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 4.w,
                    right: 4.w,
                    top: 2.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        // text: StringConstants.welcome,
                        text: code,
                        fontSize: 14,
                        color: ColorConstants.blackColor,
                        weight: FontWeight.w500,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      CustomText(
                        text: description,
                        fontSize: 12.5,
                        color: ColorConstants.greyColor,
                        weight: FontWeight.w400,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Row(
                        children: [
                          const Image(
                            image: AssetImage(
                              AssetConstant.percent,
                            ),
                            height: 24,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          CustomText(
                            text: offertext,
                            fontSize: 14,
                            color: ColorConstants.blackColor,
                            weight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  alignment: AlignmentDirectional.center,
                  height: 6.h,
                  width: 100.w,
                  decoration: const BoxDecoration(
                    color: ColorConstants.background,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: CustomText(
                    text: copy,
                    fontSize: 16,
                    weight: FontWeight.w500,
                    color: ColorConstants.rich,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
