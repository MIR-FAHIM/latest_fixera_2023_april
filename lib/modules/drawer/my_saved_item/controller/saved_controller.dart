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
import 'package:latest_fixera_2023/models/saved_model.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/repositories/home/home_repository.dart';
import 'package:latest_fixera_2023/repositories/saved_rep.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:webview_flutter/webview_flutter.dart';
class SavedItemsController extends GetxController {
  //TODO: Implement SplashscreenController
  var searchController = TextEditingController();


  final latestJobLoad = false.obs;
  final vendorID = "".obs;
  final vendorName = "".obs;
  final jobURL = "".obs;
  final vendorAbout = "".obs;
  final vendorImage = "".obs;
  final vendorBanner = "".obs;
  final vendorFav = false.obs;
  //final vendorFav = false.obs;
  var webController;

  @override
  Future<void> onInit() async {



    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }





}
