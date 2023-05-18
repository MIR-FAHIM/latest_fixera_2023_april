
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';


class LeadMarketViewScreen extends GetView<HomeViewController> {
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
                      Container(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.width *9,
                        color: Colors.white,
                        child: Center(
                          child: Image.asset(
                            "images/fixera_logo.png",
                            height: 120,
                            width: 120,
                          ),
                        ),
                      ),


                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height:MediaQuery.of(context).size.height * .7,
                          child: ListView.builder(
                              itemCount: controller.leadMarketVendorList.length,

                              itemBuilder: (BuildContext context , index){
                                var data = controller.leadMarketVendorList[index];
                                return Card(
                                  child: Container(
                                    height: 100,
                                    width: MediaQuery.of(context).size.width *9,
                                    child: Stack(

                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width *9,
                                              color: Colors.grey,
                                              child: Center(
                                                child: Image.asset(
                                                  "images/fixera_logo.png",
                                                  height: 60,
                                                  width: 120,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              height: 50,
                                              width: MediaQuery.of(context).size.width *9,

                                              color: Colors.white,
                                              child: Center(
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            height: 20,
                                                            width: 20,
                                                            decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.all(Radius.circular(40)),
                                                              border: Border.all(
                                                                width: 2,
                                                                color: Colors.green,
                                                                style: BorderStyle.solid,
                                                              ),
                                                            ),
                                                            child: Center(
                                                              child: Icon(
                                                                Icons.check,
                                                                size: 12,

                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(width: 20,),
                                                          Text(data.name!),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.center,

                                                        children: [
                                                          Text("Open Jobs", style: TextStyle(fontSize: 14, color: Colors.blue),),
                                                          SizedBox(width: 20,),
                                                          Container(height: 15, width: 2,color: Colors.black54,),
                                                          SizedBox(width: 20,),
                                                          Text("Full Profile",style: TextStyle(fontSize: 14, color: Colors.blue),),

                                                        ],
                                                      ),
                                                    ],
                                                  )
                                              ),
                                            )

                                          ],
                                        ),
                                        Positioned(
                                          left: 20,
                                          top: 20,
                                          child:   Container(
                                            height: 50,
                                            width: 50,
                                            color: Colors.grey,
                                            child: Center(
                                              child: data.avatar == "0" ?
                                              Image.asset(
                                                "images/fixera_logo.png",
                                                height: 60,
                                                width: 120,
                                              ) :
                                              Image.network(
                                                data.avatar!,
                                                height: 60,
                                                width: 120,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
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
