///
/// Class for declaring constants strings
///
class StringConstants {
  //Splash Screen
  static const String projectText = 'E-Commerce Application';

  //Auth Screens
  static const String signIn = 'Sign In';
  static const String signUp = 'Sign Up';
  static const String welcome = 'Hi! Welcome back, you\'ve been missed';
  static const String emaillabel = 'Email';
  static const String email = 'example@gmail.com';
  static const String passwordlabel = 'Password';
  static const String cnfpasswordlabel = 'Confirm Password';
  static const String password = '******************';
  static const String forgotpass = 'Forgot Password?';
  static const String diffsigninmethod1 = 'Or sign in with';
  static const String account1 = 'Don\'t have an account?';
  static const String createaccount = 'Create Account';
  static const String smalldisplay =
      'Fill your information below or register with your social account';
  static const String namelabel = 'Name';
  static const String name = 'John Doe';
  static const String agree = 'Agree with ';
  static const String tandc = 'Terms & Condition';
  static const String diffsigninmethod2 = 'Or sign up with';
  static const String account2 = 'Already have an account?';

  //Forgot Pass Screen
  static const String newPass = 'New Password';
  static const String forgotdisplaytext =
      'Your new password must be different from previosly used passwords.';
  static const String btntext = 'Create New Password';

  //user detail screen
  static const String profiletext = 'Complete Your Profile';
  static const String userdisplaytext =
      'Don\'t worry, only you can see your personal data. No one else will be able to see it.';
  static const String phonelabel = 'Phone Number';
  static const String phone = 'Enter Phone Number';
  static const String genderlabel = 'Gender';
  static const String gender = 'select';
  static const String userBtntext = 'Complete Profile';

  //Gender option //country Code
  static const String select = 'Select';
  static const String mail = 'Mail';
  static const String femail = 'Femail';
  static const String other = 'Other';
  static const String country1 = '+1';
  static const String country2 = '+91';
  static const String country3 = '+453';

  //Address Screen
  static const String addresstext = 'Add Your Address';
  static const String addresslabel = 'Address 1';
  static const String address = 'Enter your First Address';
  static const String addresslabel1 = 'Address 2 (optional)';
  static const String address1 = 'Enter your Second Address';
  static const String citylabel = 'City';
  static const String city = 'Enter your City';
  static const String statelabel = 'State';
  static const String state = 'Enter your State';
  static const String pinlabel = 'Pincode';
  static const String pin = 'Enter your Pincode';
  static const String saveAddress = 'Save';

  //Profile Tabs
  static const String profile = 'Profile';
  static const String profileName = 'Esther Howard';
  static const String row1 = 'Your Profile';
  static const String row2 = 'Payment Methods';
  static const String row3 = 'My Orders';
  static const String row4 = 'Settings';
  static const String row5 = 'Help Center';
  static const String row6 = 'Privacy Policy';
  static const String row7 = 'Invites Friends';
  static const String logout = 'Log Out';
  static const String logout1 = 'Logout';
  static const String cancel = 'Cancel';
  static const String confirmLogout = 'Yes, Logout';
  static const String confirm = 'Are you sure you want to log out?';
}

///
/// Class for storing offline data with key name
///
class StoarageKeysPrefs {
  static const String userData = 'user_data';
  static const String lastVisitedStep = 'last_visited_step';
}
