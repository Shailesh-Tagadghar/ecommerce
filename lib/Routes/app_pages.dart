// import 'package:flutter/material.dart';

import 'package:ecommerce/Modules/Auth/address.dart';
import 'package:ecommerce/Modules/Auth/forgot_password.dart';
import 'package:ecommerce/Modules/Auth/navbar.dart';
import 'package:ecommerce/Modules/Auth/profile.dart';
import 'package:ecommerce/Modules/Auth/sign_in.dart';
import 'package:ecommerce/Modules/Auth/sign_up.dart';
import 'package:ecommerce/Modules/Auth/user_detail.dart';
import 'package:ecommerce/Modules/Home/search.dart';
import 'package:ecommerce/Modules/Splash/splash_screen.dart';
import 'package:ecommerce/Routes/app_routes.dart';
import 'package:get/get.dart';

const Transition transition = Transition.cupertino;

class AppPages {
  ///
  /// Define Initial Screen Route
  ///
  static const initial = AppRoutes.splashScreen;

  ///
  /// Static list of routes with Page name, Route name & Transition
  ///
  static final routes = [
    GetPage(
        name: AppRoutes.splashScreen,
        page: () => SplashScreen(),
        transition: transition),
    GetPage(
        name: AppRoutes.signUpScreen,
        page: () => Signup(),
        transition: transition),
    GetPage(
        name: AppRoutes.signInScreen,
        page: () => SignIn(),
        transition: transition),
    GetPage(
        name: AppRoutes.forgotPassScreen,
        page: () => ForgotPassword(),
        transition: transition),
    GetPage(
        name: AppRoutes.userDetailScreen,
        page: () => UserDetail(),
        transition: transition),
    GetPage(
        name: AppRoutes.addressScreen,
        page: () => Address(),
        transition: transition),
    GetPage(
        name: AppRoutes.navbarScreen,
        page: () => const Navbar(),
        transition: transition),
    GetPage(
        name: AppRoutes.profileScreen,
        page: () => const Profile(),
        transition: transition),
    GetPage(
        name: AppRoutes.searchScreen,
        page: () => const Search(),
        transition: transition),
  ];
}
