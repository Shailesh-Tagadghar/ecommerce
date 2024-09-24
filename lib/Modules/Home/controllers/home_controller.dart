import 'dart:async';

import 'package:ecommerce/Utils/Constants/asset_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    activePage.value = 0;
    startTimer();
    super.onInit();
  }

  //for navbar selection
  var selectedIndex = 0.obs;
  //counter button
  var quantity = 1.obs;
  //Wishlist Category
  var selectedCategoryIndex = (0).obs;

  //to change navbar index
  void onItemTapped(int index) {
    // print("Tapped index: $index");
    selectedIndex.value = index;
  }

  void increment() {
    quantity.value++;
  }

  void decrement() {
    if (quantity.value > 1) {
      quantity.value--;
    }
  }

  //Home Page
  var dropdownValue = StringConstants.dropLoc1.obs;

  void setDropdownValue(String newValue) {
    dropdownValue.value = newValue;
  }

  //for banner value
  var currentPage = 0.obs;

  // for home page timer
  var hours = 2.obs;
  var minutes = 0.obs;
  var seconds = 0.obs;
  late Timer timer;

  //for get sales category
  var selectedsalesCategoryIndex = 0.obs;

  void setSelectedSalesCategory(int index) {
    selectedsalesCategoryIndex.value = index;
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (seconds.value > 0) {
        seconds.value--;
      } else if (minutes.value > 0) {
        minutes.value--;
        seconds.value = 59;
      } else if (hours.value > 0) {
        hours.value--;
        minutes.value = 59;
        seconds.value = 59;
      } else {
        timer.cancel(); // Stop the timer when it reaches zero
      }
    });
  }

  ///////////////////////////////////////////////////////////////////

  //Wishlist page list view -- list
  final List<String> wishlistCategory = <String>[
    StringConstants.category1,
    StringConstants.category2,
    StringConstants.category3,
    StringConstants.category4,
    StringConstants.category5,
    StringConstants.category6,
  ];

  void setSelectedCategory(int index) {
    selectedCategoryIndex.value = index;
  }

  //Product Details Screen Controller
  RxInt activePage = 0.obs;

  changeActivePage(int index) {
    activePage.value = index;
    pageController.jumpToPage(index);
  }

  // WishList Category List
  RxList<String> cartegoryWishlist =
      ["All", "Jacket", "Shirt", "Pant", "T-Shirt", "Specs"].obs;

  RxString selectedCategoryName = "".obs;
  RxBool showAllImages = false.obs;

  void selectCategory(String category) {
    if (selectedCategoryName.value == category) {
      selectedCategoryName.value = "";
    } else {
      selectedCategoryName.value = category;
    }
  }

  // Product Details SIZE Section
  RxList<String> productSizeList = ["S", "M", "L", "XL", "XXL", "XXXL"].obs;
  RxString selectedProductSize = "".obs;

  void selectSize(String size) {
    if (selectedProductSize.value == size) {
      selectedProductSize.value = "";
    } else {
      selectedProductSize.value = size;
    }
  }

  // Product Details Colors Section
  RxList<String> productColorList = [
    "0xff60442f",
    "0xff9a8070",
    "0xff432e1f",
    "0xff57575b",
  ].obs;

  RxList<dynamic> selectedProductColorList = [].obs;

  void selectColor(String color) {
    if (selectedProductColorList.contains(color)) {
      selectedProductColorList.remove(color);
    } else {
      selectedProductColorList.clear();
      selectedProductColorList.add(color);
    }
  }

  PageController pageController = PageController();

  RxList<String> productClothImages = [
    AssetConstant.pd3,
    AssetConstant.pd2,
    AssetConstant.pd1,
    AssetConstant.pd2,
    AssetConstant.pd3
  ].obs;

  var currentImage = ''.obs;
  var selectedProduct = ''.obs;

  void selectProduct(String productId) {
    selectedProduct.value = productId;
  }

  void updateImage(String imagePath) {
    currentImage.value = imagePath;
  }

  //Coupon copy value
  var selectedCoupon = ''.obs;

  void setCoupon(String coupon) {
    selectedCoupon.value = coupon;
  }
}
