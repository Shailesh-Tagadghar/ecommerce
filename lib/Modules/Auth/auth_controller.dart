import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var obscureText = false.obs;
  var isPasswordVisible = true.obs;
  var isCnfPasswordVisible = true.obs;
  var agreeToTerms = false.obs;
  var selectedDropdownItem = StringConstants.select.obs;
  var genderDropdownValues = const [
    StringConstants.select,
    StringConstants.mail,
    StringConstants.femail,
    StringConstants.other
  ];
  var selectedCountrycode = StringConstants.country1.obs;
  var countryCode = const [
    StringConstants.country1,
    StringConstants.country2,
    StringConstants.country3,
  ];
  var phoneNumber = ''.obs;
  //for navbar selection
  var selectedIndex = 0.obs;

  //profile page list view -- list
  final List<String> profileList = <String>[
    StringConstants.row1,
    StringConstants.row2,
    StringConstants.row3,
    StringConstants.row4,
    StringConstants.row5,
    StringConstants.row6,
    StringConstants.row7,
    StringConstants.logout,
  ];

  void toggleObscureText() {
    obscureText.value = !obscureText.value;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleCnfPasswordVisibility() {
    isCnfPasswordVisible.value = !isCnfPasswordVisible.value;
  }

  void checkBox() {
    agreeToTerms.value = !agreeToTerms.value;
  }

// Method to update the selected dropdown value
  void setSelectedDropdownItem(String value) {
    selectedDropdownItem.value = value;
  }

  // Method to update the selected country code
  void setSelectedCountryCode(String value) {
    selectedCountrycode.value = value;
  }

  // Method to update the phone number
  void setPhoneNumber(String value) {
    phoneNumber.value = value;
  }

  //to change navbar index
  void onItemTapped(int index) {
    selectedIndex.value = index;
  }

  //Validations

  // Error messages for validation
  var nameError = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;

  // Validation Methods
  void validateName(String value) {
    if (value.isEmpty) {
      nameError.value = "Please enter your name";
    } else {
      nameError.value = '';
    }
  }

  void validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      emailError.value = "Please enter a valid email";
    } else {
      emailError.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.length < 6) {
      passwordError.value = "Password should be at least 6 characters";
    } else if (!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)")
        .hasMatch(value)) {
      passwordError.value =
          "Password must include 1 lowercase, 1 uppercase, 1 number, and 1 special character";
    } else {
      passwordError.value = '';
    }
  }

  void validateConfirmPassword(String password, String confirmPassword) {
    if (password != confirmPassword) {
      confirmPasswordError.value = "Passwords do not match";
    } else {
      confirmPasswordError.value = '';
    }
  }
}
