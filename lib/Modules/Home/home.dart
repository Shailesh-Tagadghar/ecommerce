import 'package:ecommerce/Modules/Auth/Widget/custom_button.dart';
import 'package:ecommerce/Modules/Auth/Widget/custom_text.dart';
import 'package:ecommerce/Modules/Auth/services/api_service.dart';
import 'package:ecommerce/Modules/Home/Widget/banner_widget.dart';
import 'package:ecommerce/Modules/Home/Widget/category_widget.dart';
import 'package:ecommerce/Modules/Home/Widget/product_cart_widget.dart';
import 'package:ecommerce/Modules/Home/controllers/home_controller.dart';
import 'package:ecommerce/Routes/app_routes.dart';
import 'package:ecommerce/Utils/Constants/asset_constant.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:sizer/sizer.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomeController homeController = Get.put(HomeController());

  final PageController pageController = PageController();

  // List<Map<String, dynamic>> carousalItems = [];
  final carousalItems = <Map<String, dynamic>>[].obs;
  final categoryItems = <Map<String, dynamic>>[].obs;
  final salesCategoryItems = <Map<String, dynamic>>[].obs;
  final productsItems = <Map<String, dynamic>>[].obs;
  final isLoading = true.obs;

  @override
  Widget build(BuildContext context) {
    // Fetch coupons when the widget is built
    if (isLoading.value) {
      _fetchCarousal();
      _fetchCategory();
      _fetchSalesCategory();
      _fetchProducts();
    }

    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 5.w,
            right: 5.w,
            bottom: 1.5.h,
            top: 5.h,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: StringConstants.location,
                        color: ColorConstants.greyColor,
                        fontSize: 10,
                        weight: FontWeight.w400,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.location_on,
                            color: ColorConstants.rich,
                            size: 16,
                          ),
                          SizedBox(
                            width: 0.5.w,
                          ),
                          SizedBox(
                            height: 2.3.h,
                            width: 32.w,
                            child: Obx(
                              () => DropdownButton<String>(
                                value: homeController.dropdownValue.value,
                                underline: const SizedBox(),
                                icon: const Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: ColorConstants.greyColor,
                                ),
                                iconSize: 5.5.w,
                                elevation: 0,
                                // dropdownColor:
                                //     const Color.fromARGB(150, 0, 0, 0),
                                dropdownColor: ColorConstants.whiteColor,
                                style: const TextStyle(
                                  color: ColorConstants.blackColor,
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                ),
                                items: <String>[
                                  StringConstants.location,
                                  StringConstants.dropLoc1,
                                  StringConstants.dropLoc2,
                                ].map<DropdownMenuItem<String>>(
                                  (String value) {
                                    return DropdownMenuItem<String>(
                                      alignment: Alignment.bottomLeft,
                                      value: value,
                                      child: Text(value),
                                    );
                                  },
                                ).toList(),
                                onChanged: (String? newValue) {
                                  homeController.setDropdownValue(newValue!);
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    height: 4.h,
                    decoration: BoxDecoration(
                      color: ColorConstants.background,
                      border: Border.all(
                          color: ColorConstants.background, width: 1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      color: ColorConstants.background,
                      iconSize: 4.9.w,
                      icon: const Icon(
                        Icons.notification_important,
                        color: ColorConstants.blackColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 75.w,
                    height: 5.h,
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.search,
                          color: ColorConstants.rich,
                          size: 28,
                        ),
                        hintText: StringConstants.search,
                        hintStyle: const TextStyle(
                          color: ColorConstants.greyColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            color: ColorConstants.lightGrayColor,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            color: ColorConstants.lightGrayColor,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50.0),
                          borderSide: const BorderSide(
                            color: ColorConstants.lightGrayColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Container(
                    height: 5.h,
                    decoration: BoxDecoration(
                      color: ColorConstants.rich,
                      border: Border.all(
                          color: ColorConstants.background, width: 1),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      iconSize: 4.9.w,
                      icon: const Icon(
                        Bootstrap.sliders,
                        color: ColorConstants.whiteColor,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => isLoading.value
                    ? const Center(child: CircularProgressIndicator())
                    : SizedBox(
                        height: 18.h,
                        width: 100.w,
                        child: PageView.builder(
                          itemCount: carousalItems.length,
                          onPageChanged: (index) {
                            homeController.currentPage.value = index;
                          },
                          itemBuilder: (context, index) {
                            final item = carousalItems[index];
                            return BannerWidget(
                              // image: AssetConstant.banner2tp,
                              image: item['image'] ?? AssetConstant.banner1,
                              title: item['title'] ?? 'No Title',
                              subtitle: item['subtitle'] ?? 'No Subtitle',
                            );
                          },
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
                    text: StringConstants.category,
                    color: ColorConstants.blackColor,
                    fontSize: 13,
                    weight: FontWeight.w500,
                  ),
                  CustomText(
                    text: StringConstants.seeAll,
                    color: ColorConstants.rich,
                    fontSize: 11,
                    weight: FontWeight.w500,
                  ),
                ],
              ),
              SizedBox(
                height: 1.5.h,
              ),
              GestureDetector(
                onTap: () {
                  homeController.selectedIndex.value = 2;
                  Get.toNamed(AppRoutes.navbarScreen);
                },
                child: Obx(
                  () {
                    if (isLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return SizedBox(
                        height: 10.h,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryItems.length,
                          itemBuilder: (context, index) {
                            final item = categoryItems[index]; // Debugging line
                            return CategoryWidget(
                              image: AssetConstant.cat1,
                              // image: item['image'] ?? AssetConstant.cat1,
                              name: item['name'] ?? 'No name',
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      text: StringConstants.flash,
                      color: ColorConstants.blackColor,
                      fontSize: 14,
                      weight: FontWeight.w500,
                    ),
                    const Spacer(),
                    const CustomText(
                      text: StringConstants.timer,
                      color: ColorConstants.greyColor,
                      fontSize: 11,
                      weight: FontWeight.w400,
                    ),
                    buildTimeContainer(
                        homeController.hours.value.toString().padLeft(2, '0'),
                        context),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const CustomText(
                        text: ":",
                        fontSize: 14,
                        weight: FontWeight.w400,
                      ),
                    ),
                    buildTimeContainer(
                        homeController.minutes.value.toString().padLeft(2, '0'),
                        context),
                    Container(
                      padding: const EdgeInsets.all(4),
                      child: const CustomText(
                        text: ":",
                        fontSize: 14,
                        weight: FontWeight.w400,
                      ),
                    ),
                    buildTimeContainer(
                        homeController.seconds.value.toString().padLeft(2, '0'),
                        context),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Container(
                height: 7.2.h,
                padding: EdgeInsets.only(top: 1.5.h, bottom: 1.5.h),
                child: Obx(() {
                  if (isLoading.value) {
                    return const Center(
                        child:
                            CircularProgressIndicator()); // Show loading indicator
                  }
                  return ListView.builder(
                    itemCount: salesCategoryItems.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        width: 40.w,
                        padding: EdgeInsets.only(left: 4.w),
                        child: CustomButton(
                          label: salesCategoryItems[index]['name'] ??
                              'Unknown', // Adjust key based on your API response
                          labelColor: ColorConstants.blackColor,
                          action: () {
                            // Handle category selection
                            homeController.setSelectedSalesCategory(index);
                          },
                          isSelected:
                              homeController.selectedsalesCategoryIndex.value ==
                                  index,
                          btnColor: ColorConstants.whiteColor,
                          fontSize: 11,
                          weight: FontWeight.w400,
                        ),
                      );
                    },
                  );
                }),
              ),
              SizedBox(
                height: 1.h,
              ),
              Obx(
                () {
                  if (isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                      itemCount: productsItems.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final item = productsItems[index];
                        return ProductCartWidget(
                          name: item['name'],
                          price: item['price'],
                          rating: item['rating'],
                          image: item['image'] ?? AssetConstant.pd3,
                        );
                      },
                    );
                    // return const Text('dATA');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchCarousal() async {
    try {
      final carousal = await ApiService.fetchCarousal();
      carousalItems.assignAll(carousal); // Update the observable list
      isLoading.value = false; // Update loading state
    } catch (e) {
      print('Error fetching coupons: $e');
      isLoading.value = false;
    }
  }

  Future<void> _fetchCategory() async {
    try {
      final category = await ApiService.fetchCategory();
      // print('Fetched Categories: $category');
      categoryItems.assignAll(category);
      isLoading.value = false;
    } catch (e) {
      print('Error fetching Category: $e');
      isLoading.value = false;
    }
  }

  Future<void> _fetchSalesCategory() async {
    try {
      final salesCategory = await ApiService.fetchSalesCategory();
      // print('Fetched Categories: $category');
      salesCategoryItems.assignAll(salesCategory);
      isLoading.value = false;
    } catch (e) {
      print('Error fetching sales Category: $e');
      isLoading.value = false;
    }
  }

  Future<void> _fetchProducts() async {
    try {
      final products = await ApiService.fetchProducts();
      // print('Fetched Categories: $category');
      productsItems.assignAll(products);
      isLoading.value = false;
    } catch (e) {
      print('Error fetching sales Category: $e');
      isLoading.value = false;
    }
  }

  Widget buildTimeContainer(String time, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: ColorConstants.lightGrayColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: CustomText(
            text: time,
            fontSize: 10,
            weight: FontWeight.w400,
            color: ColorConstants.primary,
          ),
        ),
      ],
    );
  }
}
