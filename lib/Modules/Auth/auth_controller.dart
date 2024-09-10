import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  var obscureText = false.obs;
  var isPasswordVisible = true.obs;
  var isCnfPasswordVisible = true.obs;
  var agreeToTerms = false.obs;

  //Gender Dropdown
  var selectedDropdownItem = StringConstants.select.obs;
  var genderDropdownValues = const [
    StringConstants.select,
    StringConstants.mail,
    StringConstants.femail,
    StringConstants.other
  ];

  //phone number dropdown
  var phoneNumber = ''.obs;
  var selectedCountrycode = StringConstants.country1.obs;
  var countryCode = const [
    StringConstants.country1,
    StringConstants.country2,
    StringConstants.country3,
  ];

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

  //address validations
  var addressError = ''.obs;
  var address1Error = ''.obs;
  var cityError = ''.obs;
  var stateError = ''.obs;
  var pinError = ''.obs;

  final dummyEmail = 'test@gmail.com'.obs; // Dummy email
  final dummyPassword = 'Test@1234'.obs; // Dummy password

  var fullAddress = ''.obs; // to store full address

  void validateName(String value) {
    if (value.isEmpty) {
      nameError.value = 'Name cannot be empty';
    } else if (value.length < 3) {
      nameError.value = 'Name must be at least 3 characters long';
    } else {
      nameError.value = '';
    }
  }

  void validateEmail(String value) {
    if (value.isEmpty) {
      emailError.value = 'Email cannot be empty';
    } else if (!EmailValidator.validate(value)) {
      emailError.value = 'Please enter a valid email';
    } else {
      emailError.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.isEmpty) {
      passwordError.value = 'Password cannot be empty';
    } else if (value.length < 6) {
      passwordError.value = 'Password must be at least 6 characters long';
    } else if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$')
        .hasMatch(value)) {
      passwordError.value =
          'Please enter a password with at least 6 characters, including 1 lowercase, 1 uppercase, 1 number, and 1 special character';
    } else {
      passwordError.value = '';
    }
  }

  void validateConfirmPassword(String password, String confirmPassword) {
    confirmPasswordError.value =
        (password == confirmPassword) ? '' : "Passwords do not match";
  }

  //address validation conditionF

  void validateAddress(String address) {
    if (address.isEmpty) {
      addressError.value = 'Address cannot be empty';
    } else {
      addressError.value = '';
    }
  }

  void validateAddress1(String address1) {
    address1Error.value = '';
  }

  void validateCity(String city) {
    if (city.isEmpty) {
      cityError.value = 'City cannot be empty';
    } else {
      cityError.value = '';
    }
  }

  void validateState(String state) {
    if (state.isEmpty) {
      stateError.value = 'State cannot be empty';
    } else {
      stateError.value = '';
    }
  }

  void validatePin(String pin) {
    if (pin.isEmpty) {
      pinError.value = 'PIN cannot be empty';
    } else if (pin.length != 6) {
      pinError.value = 'PIN must be 6 digits';
    } else {
      pinError.value = '';
    }
  }

  void saveAddress(
      String address, String address1, String city, String state, String pin) {
    validateAddress(address);
    validateAddress1(address1);
    validateCity(city);
    validateState(state);
    validatePin(pin);

    String fullAddress = address;
    if (address1.isNotEmpty) {
      fullAddress += ', $address1';
    }
    fullAddress += ', $city, $state, $pin';

    if (addressError.isEmpty &&
        address1Error.isEmpty &&
        cityError.isEmpty &&
        stateError.isEmpty &&
        pinError.isEmpty) {
      print('Full Address: $fullAddress');
    }
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
