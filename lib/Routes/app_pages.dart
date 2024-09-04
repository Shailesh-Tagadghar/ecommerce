// import 'package:flutter/material.dart';

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
    // GetPage(
    //     name: AppRoutes.splashScreen,
    //     page: () => const SplashScreen(),
    //     transition: transition),
  ];
}
