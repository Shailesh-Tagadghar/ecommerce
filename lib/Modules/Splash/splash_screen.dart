import 'dart:async';

import 'package:ecommerce/Routes/app_routes.dart';
import 'package:ecommerce/Utils/Constants/asset_constant.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  final RxBool showLogo = true.obs;
  final RxBool showLottie = false.obs;

  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      showLogo.value = false;
      showLottie.value = true;

      Timer(const Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.signInScreen);
      });
    });
    return Scaffold(
      backgroundColor: ColorConstants.background,
      body: Center(
        child: Obx(
          () => showLogo.value
              ? Image.asset(AssetConstant.splashLogo)
              : showLottie.value
                  ? Lottie.asset(
                      AssetConstant.clothLottie,
                      // AssetConstant.tryLottie,
                    )
                  : const SizedBox(),
        ),
      ),
    );
  }
}
