import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:ecommerce/Modules/Auth/address.dart';
import 'package:ecommerce/Modules/Auth/auth_controller.dart';
import 'package:ecommerce/Modules/Auth/forgot_password.dart';
import 'package:ecommerce/Modules/Auth/user_detail.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AuthController instance from GetX
    final AuthController controller = Get.find<AuthController>();

    final List<Widget> _pages = [
      UserDetail(),
      ForgotPassword(),
      Address(),
      UserDetail(),
      UserDetail(),
    ];

    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      extendBody: true,
      body: Obx(() => _pages[controller.selectedIndex.value]),
      bottomNavigationBar: Obx(
        () {
          return CrystalNavigationBar(
            indicatorColor: ColorConstants.whiteColor,
            marginR: EdgeInsets.only(
              left: 6.w,
              right: 6.w,
              top: 2.h,
              bottom: 2.h,
            ),
            backgroundColor: ColorConstants.transparent,
            borderRadius: 60,
            items: <CrystalNavigationBarItem>[
              CrystalNavigationBarItem(
                icon: Icons.home,
                selectedColor: ColorConstants.rich,
                unselectedColor: ColorConstants.whiteColor,
              ),
              CrystalNavigationBarItem(
                icon: Icons.shopping_bag_outlined,
                selectedColor: ColorConstants.rich,
                unselectedColor: ColorConstants.whiteColor,
              ),
              CrystalNavigationBarItem(
                icon: Icons.favorite_border,
                selectedColor: ColorConstants.rich,
                unselectedColor: ColorConstants.whiteColor,
              ),
              CrystalNavigationBarItem(
                icon: Icons.message_outlined,
                selectedColor: ColorConstants.rich,
                unselectedColor: ColorConstants.whiteColor,
              ),
              CrystalNavigationBarItem(
                icon: Icons.person_pin,
                selectedColor: ColorConstants.rich,
                unselectedColor: ColorConstants.whiteColor,
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            onTap: (index) => controller.onItemTapped(index),
          );
        },
      ),
    );
  }
}
