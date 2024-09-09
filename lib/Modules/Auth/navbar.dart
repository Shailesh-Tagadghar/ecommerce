import 'package:crystal_navigation_bar/crystal_navigation_bar.dart';
import 'package:ecommerce/Modules/Auth/address.dart';
import 'package:ecommerce/Modules/Auth/forgot_password.dart';
import 'package:ecommerce/Modules/Auth/user_detail.dart';
import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    UserDetail(),
    ForgotPassword(),
    Address(),
    UserDetail(),
    UserDetail(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      extendBody: true,
      body: _pages[_selectedIndex],
      bottomNavigationBar: CrystalNavigationBar(
        marginR: EdgeInsets.only(
          left: 6.w,
          right: 6.w,
          top: 2.h,
          bottom: 2.h,
        ),
        backgroundColor: ColorConstants.blackColor,
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
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
