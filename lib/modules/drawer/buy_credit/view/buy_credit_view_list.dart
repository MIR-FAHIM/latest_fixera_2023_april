
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/buy_credit/controller/buy_credit_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/controller/create_estimation_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/controller/post_project_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';


class BuyCreditListView extends GetView<BuyCreditController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Buy Credit"),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Obx(
              () {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            color: AppColors.ccsYelow, width: 2),
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.height*.3,
                      width: MediaQuery.of(context).size.width,
                      child:    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: size.width * .8,
                              child: TextFormField(
                                maxLines: 1,
                                controller: controller.purposeController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Purpose',
                                  // suffixIcon: Icon(
                                  //   Icons.email_outlined,
                                  // ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty)
                                    return "Email is Required";
                                  else if (!GetUtils.isEmail(value.trim()))
                                    return "Please enter valid email";
                                  else
                                    return null;
                                },
                              ),
                            ),
                            Container(
                              width: size.width * .8,
                              child: TextFormField(
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                controller: controller.quantityController.value,
                                decoration: new InputDecoration(
                                  labelText: 'How many credits you want to purchase',
                                  // suffixIcon: Icon(
                                  //   Icons.email_outlined,
                                  // ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10.0),
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value!.trim().isEmpty)
                                    return "Email is Required";
                                  else if (!GetUtils.isEmail(value.trim()))
                                    return "Please enter valid email";
                                  else
                                    return null;
                                },
                              ),
                            ),
                            InkWell(
                              onTap: () {

                                controller.buyCreditController();

                              },
                              child: AnimatedContainer(
                                duration: Duration(seconds: 2),
                                height: controller.visible.value == 1 ? 40 : 40,
                                width: controller.visible.value == 1 ? 60 : 140,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius:
                                    BorderRadius.circular(controller.visible.value == 1 ? 60 : 10)),
                                alignment: Alignment.center,
                                child: controller.visible.value == 1
                                    ? Center(child: CircularProgressIndicator())
                                    : Text(
                                  "Buy Points",
                                  style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  controller.itemsCredit.isEmpty ? Center(child: CircularProgressIndicator() )
                 : Container(
                    height: MediaQuery.of(context).size.height*.58,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: controller.itemsCredit.value.length,
                        itemBuilder: (c, i){

                          var data = controller.itemsCredit.value[i];
                          return Column(
                            children: [
                              Card(
                                child: ListTile(
                                  title: Text(data.purpose,   style: TextStyle(
                                    color: AppColors.textColorBlack,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),),
                                  subtitle:  Text("Purchase Credit: ${data.point.toString()}",   style: TextStyle(
                                    color: AppColors.textColorBlack,
                                    fontSize: 12,
                                  ),),
                                  trailing: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColors.ccsYelow, width: 2),
                                      color: data.status == 0 ? Colors.red.withOpacity(.5) : data.status == 1 ? Colors.green.withOpacity(.5) : Colors.yellow.withOpacity(.5),
                                    ),
                                    height: MediaQuery.of(context).size.height*.05,
                                    width: MediaQuery.of(context).size.width *.2,
                                    child: data.status == 0 ? Center(
                                      child: Text("Pending",   style: TextStyle(
                                        color: AppColors.textColorBlack,
                                        fontSize: 12,
                                      ),),
                                    ) : data.status == 1 ? Center(
                                      child: Text("Approved",   style: TextStyle(
                                        color: AppColors.textColorBlack,
                                        fontSize: 12,
                                      ),),
                                    ) : Center(
                                      child: Text("Rejected",   style: TextStyle(
                                        color: AppColors.textColorBlack,
                                        fontSize: 12,
                                      ),),
                                    ) ,
                                  ) ,
                                ),
                              ),
                              controller.creditModel.value.results!.total > controller.itemsCredit.value.length && i == controller.itemsCredit.value.length -1 ?
                              InkWell(
                                onTap:(){
                                  controller.fetchNextPage();
                          },
                                  child: Text("See More", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.green)))
                                 : Container(),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          );


                        }),
                  ),
                ],
              )

            );
          }
      ),


    );
  }
}
