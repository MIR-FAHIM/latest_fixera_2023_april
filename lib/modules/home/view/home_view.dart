
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';


class HomeViewScreen extends GetView<HomeViewController> {
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
                    Text("Featured Contractors", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                    Text("People you can rely on", style: TextStyle(color: Colors.black, fontSize: 12,),),

                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height:MediaQuery.of(context).size.height *.35,
                        child: ListView.builder(
                          itemCount: controller.featureContractorList.length,
                            itemBuilder: (BuildContext context , index){
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
                                                    Text(controller.featureContractorList[index].name!),
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
                                            child: controller.featureContractorList[index].avatar == "0" ?
                                            Image.asset(
                                              "images/fixera_logo.png",
                                              height: 60,
                                              width: 120,
                                            ) :
                                            Image.network(
                                              controller.featureContractorList[index].avatar!,
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
                    SizedBox(height: 10,),
                    Text("Bid Now", style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),

                Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .32,
                        child:  ListView.builder(
                          scrollDirection: Axis.horizontal,
                            itemCount: controller.latestJobList.length,
                            itemBuilder: (BuildContext context , index){
                            var data = controller.latestJobList[index];
                              return Card(
                                elevation: 5,

                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: MediaQuery.of(context).size.height * .2,
                                    width: MediaQuery.of(context).size.width * .4,
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.verified_user, color: Colors.green,),
                                            Text(data.employer!),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.title, color:Colors.green),
                                            Text(data.title!),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.price_check, color:Colors.green),
                                            Text(data.price!.toString()),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on_outlined, color:Colors.green),
                                            Text(data.location!),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.copy, color:Colors.green),
                                            Text(data.type!),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.punch_clock_rounded, color:Colors.green),
                                            Text(data.duration!),
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
                    )


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
