import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';

import '../controller/saved_controller.dart';



class SavedItemsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedItemsController>(
          () => SavedItemsController(),
    );
  }
}
