import 'package:ecommerce/Modules/Auth/auth_controller.dart';
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
  }
}
