import 'package:ecommerce/Utils/Constants/asset_constant.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //for navbar selection
  var selectedIndex = 0.obs;
  //counter button
  var quantity = 1.obs;
  //Wishlist Category
  var selectedCategoryIndex = (-1).obs;

  //to change navbar index
  void onItemTapped(int index) {
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

  @override
  void onInit() {
    activePage.value = 0;
    super.onInit();
  }

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

  final List<String> locationList = [
    "Mumbai",
    "New York",
    "Paris",
    "Cape Town",
  ].obs;

  var dropdownValue = "Mumbai".obs;

  void setDropdownValue(String newValue) {
    dropdownValue.value = newValue;
  }

  var currentImage = ''.obs;
  var selectedProduct = ''.obs;

  void selectProduct(String productId) {
    selectedProduct.value = productId;
  }

  void updateImage(String imagePath) {
    currentImage.value = imagePath;
  }
}
