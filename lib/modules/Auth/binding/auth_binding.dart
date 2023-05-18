import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/Auth/controller/auth_controller.dart';



class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthController>(
          () => AuthController(),
    );
  }
}
