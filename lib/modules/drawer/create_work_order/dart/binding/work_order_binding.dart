import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/controller/create_estimation_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/create_work_order/dart/controller/work_order_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/controller/post_project_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';



class CreateWorkOrderBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateWorkOrderController>(
          () => CreateWorkOrderController(),
    );
  }
}
