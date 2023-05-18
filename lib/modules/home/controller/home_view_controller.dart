import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/models/Home/browse_job_model.dart';
import 'package:latest_fixera_2023/models/Home/get_contractor_model.dart';
import 'package:latest_fixera_2023/models/Home/home_api_model.dart';
import 'package:latest_fixera_2023/models/Home/lead_market_vendor_model.dart';
import 'package:latest_fixera_2023/repositories/home/home_repository.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';

class HomeViewController extends GetxController {
  //TODO: Implement SplashscreenController
  var searchController = TextEditingController();
  final categoryList = <Categories>[].obs;
  final browseJobList = <JobData>[].obs;
  final contractorList = <Datum>[].obs;
  final leadMarketVendorList = <VendorDatum>[].obs;
  final featureContractorList = <FeaturedContractors>[].obs;
  final latestJobList = <LatestJobs>[].obs;
  final latestJobLoad = false.obs;

  @override
  Future<void> onInit() async {
    getHomeApiList();
    browseJobListCOntroller();
    contractorListCOntroller();
    leadMarketVendorController();

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  getHomeApiList() {
    print("home api list working called -------");
    HomeRepository().homeApiList().then((value) {
      print(
          "working okay 11111 ${value.results!.latestJobs!.length.toString()}");
      categoryList.value = value.results!.categories!;
      featureContractorList.value = value.results!.featuredContractors!;
      latestJobList.value = value.results!.latestJobs!;
      print("category list length is ${categoryList.length}");
    });
  }

  browseJobListCOntroller() {
    print("browse api list working called -------");
    HomeRepository().browseJobList().then((value) {
      print(
          "browse hlw bro +++++ ${value.results!.jobs!.data!.length.toString()}");
      browseJobList.value = value.results!.jobs!.data!;

      print("browse list length is ${browseJobList.length}");
    });
  }

  contractorListCOntroller() {
    print("contractor api list working called -------");
    HomeRepository().getContractorList().then((value) {
      print(
          "browse hlw bro +++++ ${value.results!.users!.data!.length.toString()}");
      contractorList.value = value.results!.users!.data!.map((datum) => datum).toList();

      print("browse list length is ${browseJobList.length}");
    });
  }

  leadMarketVendorController() {
    print("contractor api list working called -------");
    HomeRepository().getLeadListMarket().then((value) {
      print(
          "browse hlw bro +++++ ${value.results!.users!.data!.length.toString()}");
      leadMarketVendorList.value = value.results!.users!.data!.map((datum) => datum).toList();

      print("browse list length is ${browseJobList.length}");
    });
  }
}
