// import 'package:flutter/material.dart';

import 'package:ecommerce/Modules/Auth/address.dart';
import 'package:ecommerce/Modules/Auth/forgot_password.dart';
import 'package:ecommerce/Modules/Home/Widget/profile_widget.dart';
import 'package:ecommerce/Modules/Home/cart.dart';
import 'package:ecommerce/Modules/Home/coupon.dart';
import 'package:ecommerce/Modules/Home/home.dart';
import 'package:ecommerce/Modules/Home/navbar.dart';
import 'package:ecommerce/Modules/Home/productdetails.dart';
import 'package:ecommerce/Modules/Home/profile.dart';
import 'package:ecommerce/Modules/Auth/sign_in.dart';
import 'package:ecommerce/Modules/Auth/sign_up.dart';
import 'package:ecommerce/Modules/Auth/user_detail.dart';
import 'package:ecommerce/Modules/Home/search.dart';
import 'package:ecommerce/Modules/Home/wishlist.dart';
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
        page: () => Profile(),
        transition: transition),
    GetPage(
        name: AppRoutes.profilewidgetScreen,
        page: () => const ProfileWidget(),
        transition: transition),
    GetPage(
        name: AppRoutes.searchScreen,
        page: () => const Search(),
        transition: transition),
    GetPage(
        name: AppRoutes.homeScreen,
        page: () => const Home(),
        transition: transition),
    GetPage(
        name: AppRoutes.cartScreen, page: () => Cart(), transition: transition),
    GetPage(
        name: AppRoutes.wishlistScreen,
        page: () => Wishlist(),
        transition: transition),
    GetPage(
        name: AppRoutes.couponScreen,
        page: () => const Coupon(),
        transition: transition),
    GetPage(
        name: AppRoutes.productDetailsScreen,
        page: () => const Productdetails(),
        transition: transition),
  ];
}
