import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/referral/controller/referal_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/referral/view/referal_table.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/modules/web_view/job_details/job_details_webview.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ReferalViewcreen extends GetView<ReferalController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
        title: Text("Referrals"),
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() {
        return SingleChildScrollView(
          child: controller.refCode.value.isEmpty?
         Container(
           child: Column(
             children: [
               controller.refCode.value.isEmpty ? Container():
               TextFormField(
                 controller: controller.referralLinkController.value,
                 decoration: InputDecoration(

                 ),),
               controller.refCode.value.isEmpty  ?
               InkWell(
                 onTap: () {
                   controller.generateRefCode();
                 },
                 child: Container(
                   color: AppColors.primaryColor,
                   height: Get.height * .06,
                   width: Get.width,
                   child: Center(child: Text("Generate Code", style: TextStyle(color: Colors.white),)),
                 ),
               )
              : InkWell(
                 onTap: () {
                   controller.shareReferralUrl();
                 },
                 child: Container(
                   color: AppColors.primaryColor,
                   height: Get.height * .06,
                   width: Get.width,
                   child: Center(child: Text("Copy/Share Link", style: TextStyle(color: Colors.white),)),
                 ),
               ),
             ],
           ),
         )
         : Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                TextFormField(
                  controller: controller.referralLinkController.value,
                  decoration: InputDecoration(

                ),),
                InkWell(
                  onTap: () {
                    controller.shareReferralUrl();
                  },
                  child: Container(
                    color: AppColors.primaryColor,
                    height: Get.height * .06,
                    width: Get.width,
                    child: Center(child: Text("Copy/Share Link", style: TextStyle(color: Colors.white),)),
                  ),
                ),

                DataTableWidget(),

              ],
            ),
          ),
        );
      }),
    );
  }
}
