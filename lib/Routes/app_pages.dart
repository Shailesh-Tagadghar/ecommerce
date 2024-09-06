// import 'package:flutter/material.dart';

import 'package:ecommerce/Modules/Auth/sign_in.dart';
import 'package:ecommerce/Modules/Auth/sign_up.dart';
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
  ];
}
