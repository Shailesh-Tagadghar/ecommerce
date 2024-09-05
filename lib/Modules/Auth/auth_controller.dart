import 'package:get/get.dart';

class AuthController extends GetxController {
  var obscureText = false.obs;
  var isPasswordObscured = true.obs;
  var agreeToTerms = false.obs;
  // var selectedDropdownItem = ''.obs;
  // var textFieldValue = ''.obs;

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
  }

  void checkBox() {
    agreeToTerms.value = !agreeToTerms.value;
  }
  // void setSelectedDropdownItem(String value) {
  //   selectedDropdownItem.value = value;
  // }

  // void setTextFieldValue(String value) {
  //   textFieldValue.value = value;
  // }
}
