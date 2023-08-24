import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/api_provider/api_provider.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/models/Home/get_contractor_model.dart';
import 'package:latest_fixera_2023/models/credit_list_model.dart';
import 'package:latest_fixera_2023/modules/browsejob/view/browse_job_page.dart';
import 'package:latest_fixera_2023/modules/contractor/view/contractor_list.dart';
import 'package:latest_fixera_2023/modules/home/view/home_view.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/lead_market_place_list_screen.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';

import '../../../../models/package_list_model.dart';
import '../../../../repositories/saved_rep.dart';

class SearchModuleController extends GetxController {
  //TODO: Implement BaseController

  var quantityController = TextEditingController().obs;
  final buyCreditList = <CreditDatum>[].obs;
  final packageList = <Package>[].obs;
  final contractorModel = <GetContractorModel>[].obs;
  final vendorList = <Package>[].obs;
  final locationList = <LanguageContractor>[].obs;
  final languageList = <LanguageContractor>[].obs;
  final skillList = <LanguageContractor>[].obs;
  final projectLength = <Package>[].obs;
  final contractorList = <DatumContractor>[].obs;
  final visible = 0.obs;
  final checkLabour = false.obs;
  final checkMaterial = false.obs;
  var searchTextController = TextEditingController().obs;
  final packageID = 0.obs;
  final contractorChecked =  false.obs;
  final brwsJobChecked =  false.obs;
  final marketPlaceChecked =  false.obs;
  var searchController = TextEditingController();
  @override
  void onInit() {
    getContractorList().then((value) {
      locationList.value = value.results.locations!;
      skillList.value = value.results.skills!;
      languageList.value = value.results.languages!;
    });
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

  Future<GetContractorModel> getContractorList() async {
    print("api token is ${Get.find<AuthService>().apiToken}");
    APIManager _manager = APIManager();
    final response = await _manager.getWithHeader(
      "${ApiUrl.getContactorList}?type=contractor",


      {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}",
        "X-Requested-With": "XMLHttpRequest",
        "Accept": "application/json"
      },
    );
    return GetContractorModel.fromJson(response);
  }
}
