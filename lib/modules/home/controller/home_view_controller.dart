import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/models/Home/browse_job_model.dart';
import 'package:latest_fixera_2023/models/Home/get_contractor_model.dart';
import 'package:latest_fixera_2023/models/Home/home_api_model.dart';
import 'package:latest_fixera_2023/models/Home/lead_market_vendor_model.dart';
import 'package:latest_fixera_2023/models/Home/see_vendor_profile_model.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/repositories/home/home_repository.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:webview_flutter/webview_flutter.dart';
class HomeViewController extends GetxController {
  //TODO: Implement SplashscreenController
  var searchController = TextEditingController();
  final categoryList = <Categories>[].obs;
  final browseJobList = <JobData>[].obs;
  final contractorList = <Datum>[].obs;
  final leadMarketVendorList = <VendorDatum>[].obs;
  final vendorJobList = <Job>[].obs;
  final featureContractorList = <FeaturedContractors>[].obs;
  final latestJobList = <LatestJobs>[].obs;
  final latestJobLoad = false.obs;
  final vendorID = "".obs;
  final vendorName = "".obs;
  final jobURL = "".obs;
  final vendorAbout = "".obs;
  final vendorImage = "".obs;
  final vendorBanner = "".obs;
  final vendorFav = false.obs;
  var webController;

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
  callWebController(){
     webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) async {
            //https://shopbasebd.com/public/uploads/shop/products/1684647182_L_2.jpeg



            // NavigationDecision.navigate;

          },
          onPageFinished: (String url) {


          },
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse("http://18.217.130.75/api/v1/webview/job/test-3?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTguMjE3LjEzMC43NS9hcGkvdjEvbG9naW4iLCJpYXQiOjE2ODQwNTY4ODYsImV4cCI6MTY4NjY0ODg4NiwibmJmIjoxNjg0MDU2ODg2LCJqdGkiOiI1VVVKM0dBTjNVRHhHd1RPIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.47D3G602EEUWomUew_B6RQEoeYrSYgHxCzeTim1kFxo"));

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

  seeVendorProfileController(ids) {
    print("see vendor profile working called -------");
    HomeRepository().seeVendorProfileRep(ids).then((value) {
      print(
          "vendor job hlw bro +++++ ${value.results!.id!.toString()}");
      vendorName.value = value.results.name!;
      vendorImage.value = value.results.avatar;
      vendorBanner.value = value.results.banner;
      vendorAbout.value = value.results.about;
      vendorFav.value = value.results.isFavourite;

      vendorJobList.value = value.results!.jobs!;

      print("vendor job list length is ${vendorJobList.length}");

      if(value.error == false){
        Get.to(SeeVendorProfile());
      } else {
        Get.showSnackbar(Ui.errorSnackBar(
            message:"The Vendor has no profile to show", title: 'Error'.tr));
      }



    });
  }
}
