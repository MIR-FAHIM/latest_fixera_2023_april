import 'dart:async';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/models/get_ref_used_list.dart';
import 'package:latest_fixera_2023/repositories/home/home_repository.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';

class ReferalController extends GetxController {
  //TODO: Implement SplashscreenController

  final referralListUsed = <DatumRef>[].obs;
  final isHTML = false.obs;
  final skillDrop = false.obs;
  final locationDrop = false.obs;
  final languageDrop = false.obs;

  final refCode = "".obs;
  final selectCardListInLocation = [].obs;
  final selectCardListInLanguage = [].obs;

  final referralLinkController = TextEditingController().obs;

  final subjectController = TextEditingController().obs;

  final bodyController = TextEditingController().obs;
  @override
  Future<void> onInit() async {
    refCode.value = Get.find<AuthService>().currentUser.value.userInfo!.referral!;
    referralLinkController.value.text =
        "https://ccsforasia.com/register?refid=${refCode.value}";
    referalUsedByList();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  referalUsedByList() {
    print("contractor api list working called referal used list -------");
    HomeRepository().referralUsedListRep().then((value) {
      GetReferralList model = GetReferralList.fromJson(value);
      referralListUsed.value = model.results!.data;
    });
  }

  generateRefCode() {
    HomeRepository().generateRefCode().then((value) {
      print("ref code is $value");
      if (value["error"] == false) {
        refCode.value = value["results"]["referral_code"];
        referralLinkController.value.text =
            "https://ccsforasia.com/register?refid=${refCode.value}";
      }
    });
  }

  shareReferralUrl() async {
    copyToClipboard(referralLinkController.value.text);
    share();
  }

  Future<void> share() async {
    await FlutterShare.share(
      title:
          'Referral Link from ${Get.find<AuthService>().currentUser.value.userInfo!.firstName}',
      linkUrl: referralLinkController.value.text,
      chooserTitle:
          'Referral Link from ${Get.find<AuthService>().currentUser.value.userInfo!.referral}',
    );
  }

  void copyToClipboard(String text) {
    Clipboard.setData(ClipboardData(text: text));
    Get.showSnackbar(Ui.successSnackBar(
        message: 'Referral Link Copied'.tr, title: 'Success'.tr));
  }
}
