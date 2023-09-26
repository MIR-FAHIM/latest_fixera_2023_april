import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/models/credit_list_model.dart';
import 'package:latest_fixera_2023/modules/browsejob/view/browse_job_page.dart';
import 'package:latest_fixera_2023/modules/contractor/view/contractor_list.dart';
import 'package:latest_fixera_2023/modules/home/view/home_view.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/lead_market_place_list_screen.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';

import '../../../../models/package_list_model.dart';
import '../../../../repositories/saved_rep.dart';

class BuyCreditController extends GetxController {
  //TODO: Implement BaseController
  var purposeController = TextEditingController().obs;
  var quantityController = TextEditingController().obs;
  final buyCreditList = <CreditDatum>[].obs;
  final packageModel = PackageListModel().obs;
  final itemsCredit = <CreditDatum>[].obs;
  final currentPage = 1.obs;
  final packageList = <Package>[].obs;
  final creditModel = BuyCreditListModel().obs;
  final visible = 0.obs;
  final packageID = 0.obs;
  @override
  void onInit() {
    packageListController();
    fetchNextPage();

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
 clearData(){
    purposeController.value.clear();
    quantityController.value.clear();
 }
  creditListController(int page) {
    SavedRepRepository().creditList(page).then((value) {
      creditModel.value = value;

      buyCreditList.value = value.results!.data!;
      itemsCredit.addAll(value.results!.data!);
      currentPage.value++;
      print("my credit list ${value.results!.data!.length}");
    });
  }
  packageListController() {
    SavedRepRepository().packageList().then((value) {
      packageModel.value = value;
      packageList.value = value.results!.packages!;
      print("my package list ${value.results!.isPendingRequest!.toString()} && ${value.results!.isAlreadyPurchase!.toString()}");
    });
  }

  Future<void> fetchNextPage() async {



    await creditListController(currentPage.value);




  }
  buyPackageController(pId) {
    visible.value++;
    SavedRepRepository()
        .buypackage(pId.toString(),)
        .then((value) {
      if (value["error"] == false) {
        Get.showSnackbar(Ui.successSnackBar(
            message:value['message'], title: 'Success'.tr));
        //creditListController();
        packageListController();
        visible.value = 0;
      } else {
        visible.value = 0;
      }
      print("buy credit ${value}");
    });
  }
  buyCreditController() {
    visible.value++;
    SavedRepRepository()
        .buyCredit(purposeController.value.text, quantityController.value.text)
        .then((value) {
      if (value["error"] == false) {
       itemsCredit.value.clear();
       clearData();
        creditListController(1);


        visible.value = 0;
      } else {
        visible.value = 0;
      }
      print("buy credit ${value}");
    });
  }
}
