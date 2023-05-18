import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/browsejob/view/browse_job_page.dart';
import 'package:latest_fixera_2023/modules/contractor/view/contractor_list.dart';
import 'package:latest_fixera_2023/modules/home/view/home_view.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/lead_market_place_list_screen.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';


class BaseController extends GetxController {
  //TODO: Implement BaseController

  final currentIndex = 0.obs;
  final categoryDataLoaded = false.obs;

  List<Widget> pages = [
    HomeViewScreen(),
    BrowseJobViewScreen(),
    ContractorListScreen(),
    LeadMarketViewScreen(),
  ];
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Widget get currentPage => pages[currentIndex.value];

  Future<void> changePageOutRoot(int index) async {
    currentIndex.value = index;
    await Get.offNamedUntil(Routes.BASE, (Route route) {
      if (route.settings.name == Routes.BASE) {
        return true;
      }
      return false;
    }, arguments: index);
  }
}
