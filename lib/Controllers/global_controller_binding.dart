import 'package:ecommerce/Modules/Auth/controllers/auth_controller.dart';
import 'package:ecommerce/Modules/Auth/services/fcm_service.dart';
import 'package:ecommerce/Modules/Home/home_controller.dart';
import 'package:get/get.dart';

import 'network_connectivity_controller.dart';

///
/// Initial Controller Binding
///
class GlobalControllerBindings extends Bindings {
  @override
  void dependencies() {
    // dashboard controller initialisation

    // login controller initialisation
    Get.put(
      NetworkConnectivityController(),
    );

    Get.put(
      AuthController(),
    );
    Get.put(
      HomeController(),
    );

    Get.put(
      FcmService(),
    );
  }
}
