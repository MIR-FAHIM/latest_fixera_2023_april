
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';


class ContractorListScreen extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<HomeViewController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Obx(
              () {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [


                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height:MediaQuery.of(context).size.height * .8,
                          child: ListView.builder(
                              itemCount: controller.contractorList.length,
                              itemBuilder: (BuildContext context , index){
                                var data = controller.contractorList[index];
                                return Card(
                                  elevation: 5,

                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      height: MediaQuery.of(context).size.height * .24,
                                      width: MediaQuery.of(context).size.width * .4,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Icon(Icons.verified_user, color: Colors.green,),
                                              Text(data.name!),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.title, color:Colors.green),
                                              Text(data.name!),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.price_check, color:Colors.green),
                                              Text(data.name!.toString()),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.location_on_outlined, color:Colors.green),
                                              Text(data.name!),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.copy, color:Colors.green),
                                              Text(data.name!),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.punch_clock_rounded, color:Colors.green),
                                              Text(data.name!),
                                            ],
                                          ),
                                          SizedBox(height: 20,),

                                          InkWell(
                                            onTap: () {
                                              //controller.visible.value++;

                                            },
                                            child: AnimatedContainer(
                                              duration: Duration(seconds: 2),
                                              height:  30,
                                              width:  100,
                                              decoration: BoxDecoration(
                                                  color: AppColors.primaryColor,
                                                  borderRadius:
                                                  BorderRadius.circular( 10)),
                                              alignment: Alignment.center,
                                              child:  Text(
                                                "View Job",
                                                style: TextStyle(
                                                  color: AppColors.backgroundColor,
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ),
                                          ),

                                        ],
                                      ),
                                    ),
                                  ),

                                );
                              }),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            );
          }
      ),


    );
  }
}
