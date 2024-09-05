import 'dart:async';

import 'package:ecommerce/Routes/app_routes.dart';
import 'package:ecommerce/Utils/Constants/asset_constant.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  final RxBool showLogo = true.obs; // Initially show the logo
  final RxBool showLottie = false.obs; // Initially hide Lottie

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      showLogo.value = false; // Hide the logo
      showLottie.value = true; // Show Lottie animation

      // Second timer to navigate to the login screen after showing Lottie for 3 seconds
      Timer(const Duration(seconds: 3), () {
        Get.toNamed(AppRoutes.signInScreen);
      });
    });
    return Scaffold(
      backgroundColor: ColorConstants.background,
      body: Center(
        child: Obx(
          () => showLogo.value
              ? Image.asset(AssetConstant.splashLogo) // Show logo for 3 seconds
              : showLottie.value
                  ? Lottie.asset(
                      // AssetConstant.fashionLottie,
                      AssetConstant.tryLottie,
                    )
                  : const SizedBox(),
        ),
      ),
    );
  }
}
