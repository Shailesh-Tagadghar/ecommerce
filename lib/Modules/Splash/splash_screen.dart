import 'dart:async';

import 'package:ecommerce/Routes/app_routes.dart';
import 'package:ecommerce/Utils/Constants/asset_constant.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SplashController controller = Get.put(SplashController());
    return Scaffold(
      backgroundColor: ColorConstants.background,
      body: Center(
        child: Obx(
          () {
            return GestureDetector(
              onTap: controller.navigateToLogin,
              child: controller.showLottie.value
                  ? Lottie.asset(
                      AssetConstant.fashionLottie,
                      height: 40.h,
                      repeat: true,
                      reverse: true,
                      animate: true,
                    )
                  : Image.asset(AssetConstant.splashLogo),
            );
          },
        ),
      ),
    );
  }
}

class SplashController extends GetxController {
  var showLottie = false.obs;

  @override
  void onInit() {
    super.onInit();

    // Automatically navigate to login screen after 4 seconds if not showing Lottie
    Timer(
      const Duration(seconds: 4),
      () {
        if (!showLottie.value) {
          Get.toNamed(AppRoutes.signInScreen);
        }
      },
    );
  }

  void navigateToLogin() {
    // Show Lottie animation
    showLottie.value = true;

    // Navigate to login screen after Lottie animation
    Future.delayed(const Duration(seconds: 3), () {
      Get.toNamed(AppRoutes.signInScreen);
    });
  }
}
