import 'package:get/get.dart';

class HomeController extends GetxController {
  //for navbar selection
  var selectedIndex = 0.obs;
  var quantity = 1.obs;
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

  // void cartincrement2() {
  //   quantity2++;
  // }

  // void cartdecrement2() {
  //   if (quantity2 > 0) {
  //     quantity2--;
  //   }
  // }
}
