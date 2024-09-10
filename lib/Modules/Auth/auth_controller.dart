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

  final dummyEmail = 'test@gmail.com'.obs; // Dummy email
  final dummyPassword = 'Test@1234'.obs; // Dummy password

  // Validation Methods
  // void validateName(String value) {
  //   if (value.isEmpty) {
  //     nameError.value = "Please enter your name";
  //   } else {
  //     nameError.value = '';
  //   }
  // }

  // void validateEmail(String value) {
  //   if (!GetUtils.isEmail(value)) {
  //     emailError.value = "Please enter a valid email";
  //   } else {
  //     emailError.value = '';
  //   }
  // }

  // void validatePassword(String value) {
  //   if (value.length < 6) {
  //     passwordError.value = "Password should be at least 6 characters";
  //   } else if (!RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)")
  //       .hasMatch(value)) {
  //     passwordError.value =
  //         "Password must include 1 lowercase, 1 uppercase, 1 number, and 1 special character";
  //   } else {
  //     passwordError.value = '';
  //   }
  // }

  // void validateConfirmPassword(String password, String confirmPassword) {
  //   if (password != confirmPassword) {
  //     confirmPasswordError.value = "Passwords do not match";
  //   } else {
  //     confirmPasswordError.value = '';
  //   }
  // }

  // //for login and to check the password matching
  // bool validateForm(String email, String password) {
  //   bool isValid = true;

  //   // Clear previous errors
  //   emailError.value = '';
  //   passwordError.value = '';

  //   // Email validation
  //   if (email.isEmpty) {
  //     emailError.value = 'Please enter an email';
  //     isValid = false;
  //   } else if (!GetUtils.isEmail(email)) {
  //     emailError.value = 'Please enter a valid email';
  //     isValid = false;
  //   }

  //   // Password validation
  //   if (password.isEmpty) {
  //     passwordError.value = 'Please enter a password';
  //     isValid = false;
  //   } else if (password.length < 6 ||
  //       !RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
  //           .hasMatch(password)) {
  //     passwordError.value =
  //         'Password must be at least 6 characters with 1 uppercase, 1 lowercase, 1 number, and 1 special character';
  //     isValid = false;
  //   }

  //   return isValid;
  // }

  // Validation Methods
  String? validateField(String value, String emptyError,
      {bool Function(String)? condition, String? conditionError}) {
    if (value.isEmpty) return emptyError;
    if (condition != null && !condition(value)) return conditionError;
    return null;
  }

  // Reusable validation methods
  void validateName(String value) {
    nameError.value = validateField(value, "Please enter your name") ?? '';
  }

  void validateEmail(String value) {
    emailError.value = validateField(value, "Please enter a valid email",
            condition: GetUtils.isEmail,
            conditionError: "Invalid email format") ??
        '';
  }

  void validatePassword(String value) {
    passwordError.value = validateField(
            value, "Password should be at least 6 characters",
            condition: (val) =>
                RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W)")
                    .hasMatch(val),
            conditionError:
                "Password must include 1 lowercase, 1 uppercase, 1 number, and 1 special character") ??
        '';
  }

  void validateConfirmPassword(String password, String confirmPassword) {
    confirmPasswordError.value =
        (password == confirmPassword) ? '' : "Passwords do not match";
  }

  // Form validation
  bool validateForm(String email, String password) {
    validateEmail(email);
    validatePassword(password);

    return emailError.isEmpty && passwordError.isEmpty;
  }

  // checking whether email and password is match or not...
  bool authenticateUser(String email, String password) {
    if (email == dummyEmail.value && password == dummyPassword.value) {
      return true; // Successful authentication
    } else {
      if (email != dummyEmail.value) {
        emailError.value = 'User email not found';
      } else if (password != dummyPassword.value) {
        passwordError.value = 'Incorrect password';
      }
      return false; // Authentication failed
    }
  }
}
