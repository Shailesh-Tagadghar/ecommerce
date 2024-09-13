import 'dart:io';

import 'package:ecommerce/Modules/Auth/services/api_service.dart';
// import 'package:ecommerce/Modules/Auth/services/storage_util.dart';
import 'package:ecommerce/Routes/app_routes.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class AuthController extends GetxController {
  var obscureText = false.obs;
  var isPasswordVisible = true.obs;
  var isCnfPasswordVisible = true.obs;
  var agreeToTerms = false.obs;

  // Profile Image
  var profileImage = Rxn<File?>(null); // To store selected image

  //Gender Dropdown
  var selectedDropdownItem =
      StringConstants.select.obs; //default select dropdown
  var genderDropdownValues = const [
    StringConstants.select,
    StringConstants.male,
    StringConstants.female,
    StringConstants.other
  ];

  //phone number dropdown
  var phoneNumber = ''.obs;
  var selectedCountrycode =
      StringConstants.country1.obs; //default country code dropdown
  var countryCode = const [
    StringConstants.country1,
    StringConstants.country2,
    StringConstants.country3,
  ];

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
    validateGender(value); // to validate
  }

  // Method to update the selected country code
  void setSelectedCountryCode(String value) {
    selectedCountrycode.value = value;
  }

  // Method to update the phone number
  void setPhoneNumber(String value) {
    phoneNumber.value = value;
    validatePhone(value); // to validate
  }

  //Validations

  // Error messages for validation
  var nameError = ''.obs;
  var emailError = ''.obs;
  var passwordError = ''.obs;
  var confirmPasswordError = ''.obs;
  var checkboxError = ''.obs;
  //for user_details screen validations
  // var imageError = ''.obs;
  var imageError = RxString('');
  var phoneError = ''.obs;
  var genderError = ''.obs;

  //address validations
  var addressError = ''.obs;
  var address1Error = ''.obs;
  var cityError = ''.obs;
  var stateError = ''.obs;
  var pinError = ''.obs;

  var userName = ''.obs; //to store username from signUp screen

  final dummyEmail = 'test@gmail.com'.obs; // Dummy email
  final dummyPassword = 'Test@1'.obs; // Dummy password

  var fullAddress = ''.obs; // to store full address

  // Image Picker instance
  final ImagePicker _picker = ImagePicker();

  // Method to pick image from gallery
  // Future<void> pickImageFromGallery() async {
  //   final XFile? pickedFile =
  //       await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     profileImage.value = File(pickedFile.path);
  //     imageError.value = '';
  //   }
  // }
  Future<void> pickImageFromGallery() async {
    try {
      // final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        imageError.value = ''; // Clear any previous error
      } else {
        imageError.value = 'No image selected.';
      }
    } catch (e) {
      imageError.value = 'Failed to pick image: $e';
    }
  }

  // Method to pick image from camera
  // Future<void> pickImageFromCamera() async {
  //   final XFile? pickedFile =
  //       await _picker.pickImage(source: ImageSource.camera);
  //   if (pickedFile != null) {
  //     profileImage.value = File(pickedFile.path);
  //     imageError.value = '';
  //   }
  // }
  Future<void> pickImageFromCamera() async {
    try {
      // final pickedFile = await _picker.pickImage(source: ImageSource.camera);
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.camera);

      if (pickedFile != null) {
        profileImage.value = File(pickedFile.path);
        imageError.value = ''; // Clear any previous error
      } else {
        imageError.value = 'No image selected.';
      }
    } catch (e) {
      imageError.value = 'Failed to pick image: $e';
    }
  }

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

  void validateCheckbox() {
    if (!agreeToTerms.value) {
      checkboxError.value =
          'You can\'t proceed please, Accept Terms & Condition first';
    } else {
      checkboxError.value = '';
    }
  }

  // Method to validate phone number
  void validatePhone(String value) {
    if (value == '+1' || value.isEmpty) {
      phoneError.value = 'Phone number cannot be empty || select country code';
    } else if (!RegExp(r'^\d{10,15}$').hasMatch(value)) {
      phoneError.value = 'Please enter a valid phone number';
    } else {
      phoneError.value = '';
    }
  }

  // Method to validate gender
  void validateGender(String value) {
    if (value == 'Select' || value.isEmpty) {
      genderError.value = 'Please select a gender';
    } else {
      genderError.value = '';
    }
  }

  // Method to validate image
  void validateImage() {
    if (profileImage.value == null) {
      imageError.value = 'Profile image is required';
    } else {
      imageError.value = '';
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

  var updatedPassword = ''.obs; // to store new password value

  void saveNewPassword(String newPassword) {
    updatedPassword.value = newPassword;
    print("New Password: $newPassword");
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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Method to submit user details
  void submitUserDetails() {
    // Perform validations
    validateImage();
    validateGender(selectedDropdownItem.value);
    validatePhone(phoneNumber.value);

    // Check for errors
    if (imageError.value.isEmpty &&
        genderError.value.isEmpty &&
        phoneError.value.isEmpty) {
      // All validations passed
      // Proceed to save the details or navigate
      print('User Details:');
      print('Name: ${userName.value}');
      print('Phone: ${selectedCountrycode.value} ${phoneNumber.value}');
      print('Gender: ${selectedDropdownItem.value}');
      print('Profile Image Path: ${profileImage.value?.path}');

      if (nameController.text.isEmpty ||
          emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        Get.snackbar('Validation Error', 'Please fill in all fields.');
        return;
      }

      final addressData = {
        'signup_data': {
          'name': nameController.text,
          'email': emailController.text,
          'password': passwordController.text,
        },
        'image': profileImage.value?.path ?? '',
        'name': nameController.text,
        'gender': selectedDropdownItem.value,
        'phone': '${selectedCountrycode.value}-${phoneNumber.value}',
        'address': fullAddress,
      };
      print('user_details Fields Data : $addressData');

      // Navigate to Address Screen or perform desired action
      // Get.toNamed(AppRoutes());
      // Get.toNamed(
      //   AppRoutes.addressScreen,
      // );
    }
  }

  // Optionally, set the user name from sign-up
  void setUserName(String name) {
    userName.value = name;
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

  ///////////////////
  // API Integration
  final ApiService _apiService = ApiService();
  // final _fcmToken = StorageUtil.read('fcm_token');
  final _fcmToken = GetStorage().read('fcm_token');
  // final TextEditingController nameController = TextEditingController();
  // final TextEditingController emailController = TextEditingController();
  // final TextEditingController passwordController = TextEditingController();

  // Future<void> register(Map<String, dynamic> userData) async {
  //   try {
  //     await _apiService.registerUser(userData);
  //     print('fcm_token : $_fcmToken');
  //     Get.toNamed(
  //       AppRoutes.navbarScreen,
  //     );
  //   } catch (e) {
  //     print(e);
  //   }
  // }
  // Future<void> register() async {
  //   // Prepare user data
  //   Map<String, dynamic> userData = {
  //     'name': userName.value,
  //     'email': emailController.text, // Assume you have a TextEditingController
  //     'password':
  //         passwordController.text, // Assume you have a TextEditingController
  //   };

  //   try {
  //     // Ensure image is picked
  //     if (profileImage.value == null) {
  //       throw Exception('No image selected.');
  //     }

  //     // Register user
  //     await _apiService.registerUser(userData, profileImage.value);

  //     print('fcm_token : $_fcmToken');
  //     Get.toNamed(AppRoutes.navbarScreen);
  //   } catch (e) {
  //     print('Error registering user: $e');
  //     Get.snackbar('Registration Failed', e.toString());
  //   }
  // }

  Future<void> register(Map<String, dynamic> userData) async {
    try {
      // if (profileImage.value == null) {
      //   throw Exception('No image selected.');
      // }
      final imageFile = profileImage.value;
      if (imageFile == null) {
        throw Exception('No image selected.');
      }

      // Ensure userData contains the correct information
      // await _apiService.registerUser(userData, profileImage.value);
      await _apiService.registerUser(userData, imageFile);

      print('fcm_token : $_fcmToken');
      Get.toNamed(AppRoutes.navbarScreen);
    } catch (e) {
      print('Error registering user: $e');
      Get.snackbar('Registration Failed', e.toString());
    }
  }

  Future<void> login(String email, String password) async {
    try {
      await _apiService.loginUser(email, password, _fcmToken);
      Get.toNamed(
        AppRoutes.navbarScreen,
      );
    } catch (e) {
      print(e);
    }
  }
}
