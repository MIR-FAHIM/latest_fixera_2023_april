import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/controller/post_project_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';

import '../controller/post_lead_controller.dart';



class PostLeadBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostLeadController>(
          () => PostLeadController(),
    );
  }
}
