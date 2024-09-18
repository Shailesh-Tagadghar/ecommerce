import 'package:ecommerce/Utils/Constants/string_constant.dart';
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
}
