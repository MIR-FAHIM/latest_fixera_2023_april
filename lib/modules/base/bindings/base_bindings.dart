import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/base/controller/base_view_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';


class BaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BaseController>(
          () => BaseController(),
    );

    Get.lazyPut<HomeViewController>(
          () => HomeViewController(),
    );


  }
}
