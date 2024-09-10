import 'package:get/get.dart';

class HomeController extends GetxController {
  //for navbar selection
  var selectedIndex = 0.obs;

  //to change navbar index
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }
}
