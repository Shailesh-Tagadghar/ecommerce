import 'package:ecommerce/Controllers/global_controller_binding.dart';
import 'package:ecommerce/Routes/app_pages.dart';
import 'package:ecommerce/Utils/Constants/string_constant.dart';
import 'package:ecommerce/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (
        context,
        orientation,
        deviceType,
      ) {
        return GetMaterialApp(
          title: StringConstants.projectText,
          debugShowCheckedModeBanner: false,
          initialBinding: GlobalControllerBindings(),
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
        );
      },
    );
  }
}
