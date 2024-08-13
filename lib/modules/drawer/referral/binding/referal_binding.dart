import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/referral/controller/referal_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';



class ReferalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferalController>(
          () => ReferalController(),
    );
  }
}
