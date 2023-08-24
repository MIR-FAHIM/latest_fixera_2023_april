import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/base/controller/base_view_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/search_module/controller/search_controller.dart';




class SearchModuleBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SearchModuleController>(
          () => SearchModuleController(),
    );


  }
}
