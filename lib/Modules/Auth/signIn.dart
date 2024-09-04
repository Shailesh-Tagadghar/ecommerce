import 'package:ecommerce/Utils/Constants/color_constant.dart';
import 'package:flutter/material.dart';

class Signin extends StatelessWidget {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.background,
      appBar: AppBar(
        title: const Text('Sign In Page'),
        backgroundColor: ColorConstants.background,
      ),
      body: const Center(
        child: Text('SIGN In Here...'),
      ),
    );
  }
}
