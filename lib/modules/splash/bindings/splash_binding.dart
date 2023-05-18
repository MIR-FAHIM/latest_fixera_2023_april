import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';



class SplashscreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(
          () => SplashscreenController(),
    );
  }
}
