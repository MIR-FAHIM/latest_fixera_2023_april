import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/referral/controller/referal_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/referral/view/referal_table.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                controller.refCode.value.isEmpty ? "Generate Your Referral Code" : "Your Referral Link",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: controller.referralLinkController.value,
                decoration: InputDecoration(
                  labelText: "Referral Link",
                  hintText: "Your referral link will appear here",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: AppColors.primaryColor),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              controller.refCode.value.isEmpty
              ? ElevatedButton(
                onPressed: controller.refCode.value.isEmpty
                    ? () {
                  controller.generateRefCode();
                }
                    : () {
                  controller.shareReferralUrl();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  controller.refCode.value.isEmpty ? "Generate Code" : "Copy/Share Link",
                  style: TextStyle(color: Colors.white),
                ),
              ):
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(

                    onPressed: () {
                      controller.shareReferralUrl();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Copy",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  ElevatedButton(
                    onPressed:() {
                      controller.shareReferralUrl();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                     "Share",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              if (!controller.refCode.value.isEmpty) DataTableWidget(),
            ],
          ),
        );
      }),
    );
  }
}
