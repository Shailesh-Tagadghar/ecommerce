import 'package:dotted_line/dotted_line.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_button.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Modules/Home/Widget/cart_item_widget.dart';
import 'package:ecommerce/Routes/app_routes.dart';
import 'package:ecommerce/Utils/Constants/asset_constant.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class Cart extends StatelessWidget {
  Cart({super.key});
  final List<Map<String, String>> cartItems = [
    {
      'image': AssetConstant.pd1,
      'title': StringConstants.productname,
      'size': StringConstants.size,
      'price': StringConstants.productprice,
    },
    {
      'image': AssetConstant.pd2,
      'title': StringConstants.productname1,
      'size': StringConstants.size1,
      'price': StringConstants.productprice1,
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      appBar: AppBar(
        backgroundColor: ColorConstants.whiteColor,
        foregroundColor: ColorConstants.whiteColor,
        shadowColor: ColorConstants.whiteColor,
        surfaceTintColor: ColorConstants.whiteColor,
        toolbarHeight: 10.h,
        leadingWidth: 15.w,
        title: const CustomText(
          text: StringConstants.cart,
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
      body: Padding(
        padding: EdgeInsets.only(
          left: 3.w,
          right: 3.w,
          bottom: 2.h,
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return Column(
                    children: [
                      CartItemWidget(
                        image: item['image']!,
                        title: item['title']!,
                        size: item['size']!,
                        price: item['price']!,
                      ),
                      SizedBox(height: 1.5.h),
                      Divider(
                        height: 1.h,
                        color: ColorConstants.lightGrayColor,
                        thickness: 1,
                      ),
                    ],
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                bottom: 10.h,
              ),
              child: CustomButton(
                label: StringConstants.checkout,
                btnColor: ColorConstants.rich,
                labelColor: ColorConstants.whiteColor,
                isSelected: true,
                action: () {
                  showCheckout(context);
                },
                height: 6.h,
                fontSize: 14,
                weight: FontWeight.w500,
                width: 85.w,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showCheckout(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: ColorConstants.whiteColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.0),
        ),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            bottom: 4.h,
            top: 3.h,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: 1.w,
                        right: 1.w,
                      ),
                      child: TextField(
                        onTap: () {
                          Get.toNamed(AppRoutes.couponScreen);
                        },
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: EdgeInsets.only(
                              right: 1.5.w,
                              top: 0.5.h,
                              bottom: 0.5.h,
                            ),
                            child: CustomButton(
                              label: StringConstants.apply,
                              isSelected: true,
                              btnColor: ColorConstants.rich,
                              height: 4.5.h,
                              width: 25.w,
                              weight: FontWeight.w400,
                            ),
                          ),
                          hintText: StringConstants.promo,
                          hintStyle: const TextStyle(
                            color: ColorConstants.greyColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(
                              color: ColorConstants.background,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(
                              color: ColorConstants.background,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            borderSide: const BorderSide(
                              color: ColorConstants.background,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: StringConstants.subtotal,
                          color: ColorConstants.greyColor,
                          fontSize: 12,
                          weight: FontWeight.w400,
                        ),
                        CustomText(
                          text: '\$${StringConstants.subtotalprice}',
                          color: ColorConstants.blackColor,
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: StringConstants.delivery,
                          color: ColorConstants.greyColor,
                          fontSize: 12,
                          weight: FontWeight.w400,
                        ),
                        CustomText(
                          text: '\$${StringConstants.deliveryfee}',
                          color: ColorConstants.blackColor,
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: StringConstants.discount,
                          color: ColorConstants.greyColor,
                          fontSize: 12,
                          weight: FontWeight.w400,
                        ),
                        CustomText(
                          text: '-\$${StringConstants.discountcharge}',
                          color: ColorConstants.blackColor,
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    DottedLine(
                      dashColor: ColorConstants.lightGrayColor,
                      lineThickness: 1,
                      dashGapColor: ColorConstants.whiteColor,
                      dashGapLength: 2.w,
                      dashLength: 2.w,
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(
                          text: StringConstants.total,
                          color: ColorConstants.greyColor,
                          fontSize: 12,
                          weight: FontWeight.w400,
                        ),
                        CustomText(
                          text: '\$${StringConstants.totalcost}',
                          color: ColorConstants.blackColor,
                          fontSize: 12,
                          weight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    CustomButton(
                      label: StringConstants.checkoutbtn,
                      btnColor: ColorConstants.rich,
                      isSelected: true,
                      height: 6.h,
                      weight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
