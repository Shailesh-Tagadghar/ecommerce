import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Modules/Auth/services/api_service.dart';
import 'package:ecommerce/Modules/Home/Widget/coupon_item_widget.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class Coupon extends StatefulWidget {
  Coupon({super.key});

  @override
  State<Coupon> createState() => _CouponState();
}

class _CouponState extends State<Coupon> {
  // final List<Map<String, String>> couponItems = [
  //   {
  //     'title': StringConstants.title,
  //     'descreption': StringConstants.descreption,
  //     'amount': StringConstants.offertext,
  //     'copy': StringConstants.copy,
  //   },
  //   {
  //     'title': StringConstants.title,
  //     'descreption': StringConstants.descreption,
  //     'amount': StringConstants.offertext,
  //     'copy': StringConstants.copy,
  //   },
  // ];

  List<Map<String, dynamic>> couponItems = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCoupons();
  }

  Future<void> _fetchCoupons() async {
    try {
      final coupons = await ApiService.fetchCoupons();
      setState(() {
        couponItems = coupons;
        isLoading = false;
      });
    } catch (e) {
      print('Error fetching coupons: $e');
      setState(() {
        isLoading = false; // Stop loading even on error
      });
    }
  }

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
          text: StringConstants.coupon,
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
          left: 6.w,
          right: 6.w,
          bottom: 2.h,
        ),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    text: StringConstants.offers,
                    fontSize: 15,
                    weight: FontWeight.w500,
                    color: ColorConstants.blackColor,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  // Place Expanded inside Column, outside of Padding
                  Expanded(
                    child: ListView.builder(
                      itemCount: couponItems.length,
                      itemBuilder: (context, index) {
                        final item = couponItems[index];
                        return Column(
                          children: [
                            CouponItemWidget(
                              title: item['title'] ?? 'No Title',
                              descreption:
                                  item['descreption'] ?? 'No Description',
                              // amount: '${item['amount']}% off',
                              amount:
                                  '${StringConstants.offertext} ${item['amount']}% ${StringConstants.offertextII}',
                              copy: item['copy'] ?? 'Copy',
                            ),
                            SizedBox(
                              height: 1.5.h,
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
