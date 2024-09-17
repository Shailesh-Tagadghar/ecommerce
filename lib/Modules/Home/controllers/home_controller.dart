import 'dart:io';

import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  //for navbar selection
  var selectedIndex = 0.obs;
  //counter button
  var quantity = 1.obs;
  //Wishlist Category
  var selectedCategoryIndex = (-1).obs;
  // var quantity2 = 1.obs;

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

  // Reactive variable for profile image
  var profileImage = Rxn<File>(); // Rxn to allow nullability
  var userName = ''.obs; // Reactive variable for username

  @override
  void onInit() {
    super.onInit();
    _loadUserData();
  }

  // Method to load user data from GetStorage
  void _loadUserData() {
    final userData = GetStorage().read<Map<String, dynamic>>('user_data');
    if (userData != null) {
      final storedUserName = userData['name'];
      final storedUserImagePath = userData['image'];

      if (storedUserName != null) {
        userName.value = storedUserName;
      }
      if (storedUserImagePath != null) {
        updateProfileImage(File(storedUserImagePath));
      }
    }
  }

  // Method to update profileImage
  void updateProfileImage(File? image) {
    profileImage.value = image;
  }

  // Method to update username
  void updateUserName(String name) {
    userName.value = name;
    // Save username to storage as well
    final storage = GetStorage();
    final userData = storage.read<Map<String, dynamic>>('user_data') ?? {};
    userData['name'] = name;
    storage.write('user_data', userData);
  }
}
