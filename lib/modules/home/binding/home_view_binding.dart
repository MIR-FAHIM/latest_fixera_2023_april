import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';



class HomeViewcreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeViewController>(
          () => HomeViewController(),
    );
  }
}
