import 'package:ecommerce/Modules/Auth/Widget/custom_button.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Modules/Home/controllers/home_controller.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Productdetails extends StatefulWidget {
  const Productdetails({super.key});

  @override
  State<Productdetails> createState() => _ProductdetailsState();
}

class _ProductdetailsState extends State<Productdetails> {
  HomeController homeController = Get.find();

  @override
  void initState() {
    homeController.showAllImages.value = false;
    homeController.activePage.value = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SizedBox(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    SizedBox(
                      height: 46.5.h,
                      child: PageView.builder(
                        controller: homeController.pageController,
                        itemCount: homeController.productClothImages.length,
                        onPageChanged: (value) {
                          homeController.changeActivePage(value);
                        },
                        itemBuilder: (context, index) {
                          return Image.asset(
                            homeController.productClothImages[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 5.8.w),
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConstants.whiteColor,
                              ),
                              child: IconButton(
                                padding: const EdgeInsets.all(1),
                                iconSize: 24,
                                icon: const Icon(
                                  Icons.arrow_back,
                                  color: ColorConstants.blackColor,
                                ),
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                            const CustomText(
                              text: StringConstants.product,
                              fontSize: 14,
                              weight: FontWeight.w500,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 5.8.w),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: ColorConstants.whiteColor,
                              ),
                              child: IconButton(
                                iconSize: 26,
                                icon: const Icon(
                                  Icons.favorite_border_rounded,
                                  color: ColorConstants.blackColor,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 2.5.h,
                            top: 26.h,
                          ),
                          height: 6.8.h,
                          width: 31.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: ColorConstants.whiteColor,
                          ),
                          child: Obx(() {
                            // Check if we need to show all images or just the first few
                            bool showAll = homeController.showAllImages.value;
                            int itemCount = showAll
                                ? homeController.productClothImages.length
                                : (homeController.productClothImages.length > 2
                                    ? 3
                                    : homeController.productClothImages.length);

                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: itemCount,
                              itemBuilder: (context, index) {
                                // Show the "More" container if it's not showing all images and we're on the last index
                                if (index == 2 && !showAll) {
                                  int remainingImages =
                                      homeController.productClothImages.length -
                                          3;

                                  return InkWell(
                                    onTap: () {
                                      // When tapped, expand to show all images
                                      homeController.showAllImages.value = true;
                                    },
                                    child: Container(
                                      width: 12.5.w, // Adjust width as needed
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade300,
                                      ),
                                      child: Center(
                                        child: CustomText(
                                          text: '+$remainingImages',
                                          fontSize: 12,
                                          weight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  );
                                } else {
                                  // Handle the normal image rendering and scaling

                                  return InkWell(
                                    onTap: () {
                                      // Update the active page and jump to the selected page in PageView
                                      homeController.changeActivePage(index);
                                      homeController.pageController
                                          .jumpToPage(index);
                                    },
                                    child: Obx(() {
                                      // Wrap the container with Obx to ensure real-time scaling
                                      bool isSelected =
                                          homeController.activePage.value ==
                                              index;
                                      return Transform.scale(
                                        scale: isSelected
                                            ? 1.2
                                            : 1.0, // Apply scale effect based on selection
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: 0.8.h,
                                            bottom: 0.8.h,
                                            left: 1.5.w,
                                            right: 1.4.w,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.asset(
                                              homeController
                                                  .productClothImages[index],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  );
                                }
                              },
                            );
                          }),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 6.w,
                    left: 6.w,
                    top: 4.h,
                    bottom: 4.h,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //API
                          const CustomText(
                            text: StringConstants.styles,
                            fontSize: 12,
                            weight: FontWeight.w400,
                            color: ColorConstants.greyColor,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber[500],
                                size: 25,
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              //API
                              const CustomText(
                                text: StringConstants.rating,
                                fontSize: 13,
                                weight: FontWeight.w400,
                                color: ColorConstants.greyColor,
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      const CustomText(
                        text: StringConstants.productName,
                        fontSize: 14,
                        weight: FontWeight.w500,
                        color: ColorConstants.blackColor,
                      ),
                      SizedBox(
                        height: 2.5.h,
                      ),
                      const CustomText(
                        text: StringConstants.product,
                        fontSize: 13,
                        weight: FontWeight.w500,
                        color: ColorConstants.blackColor,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          const CustomText(
                            text: StringConstants.productDetailText,
                            color: ColorConstants.greyColor,
                            fontSize: 12,
                            weight: FontWeight.w500,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const CustomText(
                              text: StringConstants.readMore,
                              color: ColorConstants.rich,
                              fontSize: 12,
                              weight: FontWeight.w500,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Divider(
                        thickness: 0.02.h,
                        color: ColorConstants.greyColor,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      const CustomText(
                        text: StringConstants.sizeText,
                        color: ColorConstants.blackColor,
                        weight: FontWeight.w500,
                        fontSize: 14,
                      ),
                      SizedBox(
                        height: 0.7.h,
                      ),
                      SizedBox(
                        height: 4.h,
                        child: ListView.builder(
                          itemCount: homeController.productSizeList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            String size = homeController.productSizeList[index];
                            return Obx(
                              () {
                                bool isSelected =
                                    homeController.selectedProductSize.value ==
                                        size;
                                return InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () {
                                    homeController.selectSize(size);
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: isSelected
                                          ? ColorConstants.primary
                                          : ColorConstants.whiteColor,
                                      border: Border.all(
                                        color: isSelected
                                            ? ColorConstants.primary
                                            : ColorConstants.lightGrayColor,
                                      ),
                                    ),
                                    margin: EdgeInsets.only(right: 4.w),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 12.0,
                                        right: 12.0,
                                      ),
                                      child: CustomText(
                                        text: size,
                                        fontSize: 11,
                                        weight: FontWeight.w600,
                                        color: isSelected
                                            ? ColorConstants.whiteColor
                                            : ColorConstants.blackColor,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),

                      //API
                      Row(
                        children: [
                          const CustomText(
                            text: StringConstants.colorText,
                            color: ColorConstants.blackColor,
                            weight: FontWeight.w500,
                            fontSize: 14,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          const CustomText(
                            text: StringConstants.color,
                            color: ColorConstants.greyColor,
                            weight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      SizedBox(
                        height: 3.5.h,
                        child: ListView.builder(
                          itemCount: homeController.productColorList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              splashColor: Colors.transparent,
                              onTap: () {
                                String selectedColor =
                                    homeController.productColorList[index];
                                homeController.selectColor(selectedColor);
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 2.w),
                                height: 3.5.h,
                                width: 6.5.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(int.parse(
                                      homeController.productColorList[index])),
                                  shape: BoxShape.circle,
                                ),
                                child: Obx(
                                  () => Container(
                                    height: 12,
                                    width: 12,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: homeController
                                              .selectedProductColorList
                                              .contains(homeController
                                                  .productColorList[index])
                                          ? Colors.white
                                          : Colors.transparent,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 10.h,
        width: 100.w,
        decoration: const BoxDecoration(
          color: ColorConstants.whiteColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: ColorConstants.lightGrayColor,
              spreadRadius: 1,
              blurRadius: 3,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: StringConstants.priceText,
                  fontSize: 12.5,
                  color: ColorConstants.greyColor,
                  weight: FontWeight.w400,
                ),
                CustomText(
                  text: '\$${StringConstants.price}',
                  fontSize: 13.5,
                  weight: FontWeight.w500,
                ),
              ],
            ),
            SizedBox(
              width: 5.w,
            ),
            SizedBox(
              width: 50.w,
              height: 5.8.h,
              child: CustomButton(
                label: StringConstants.addCart,
                btnColor: ColorConstants.rich,
                height: 6.h,
                weight: FontWeight.w400,
                isSelected: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
