
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/modules/web_view/job_details/job_details_webview.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';
import 'package:cached_network_image/cached_network_image.dart';

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
                      child: controller.featureContractorList.value.isEmpty ? Center(child: CircularProgressIndicator(color: Colors.green,)):Container(
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
                                              mainAxisAlignment: MainAxisAlignment.center,

                                              children: [

                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    SizedBox(width: MediaQuery.of(context).size.width * .3,),
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
                                                    GestureDetector(
                                                      onTap:(){
                                                       // controller.jobURL.value = controller.featureContractorList[index].
                                                       // Get.to(JobDetailsWebView());
                                          },
                                                        child: Text("Open Jobs", style: TextStyle(fontSize: 14, color: Colors.blue),)),
                                                    SizedBox(width: 20,),
                                                    Container(height: 15, width: 2,color: Colors.black54,),
                                                    SizedBox(width: 20,),
                                                    GestureDetector(
                                                      onTap: (){
                                                        controller.seeVendorProfileController( controller.featureContractorList[index].id);
                                                      },
                                                        child: Text("Full Profile",style: TextStyle(fontSize: 14, color: Colors.blue),)),

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
                                            Container(
                                              color: Colors.grey.shade200,

                                              height: 60,
                                              width: 60,
                                              child: Center(
                                                child: Text("255x255", style: TextStyle(fontSize: 10),),
                                              ),

                                            ) :
                                            CachedNetworkImage(
                                              imageUrl: controller.featureContractorList[index].avatar!,
                                              placeholder: (context, url) => CircularProgressIndicator(color: Colors.green,),
                                              errorWidget: (context, url, error) => Icon(Icons.error),
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


                Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * .35,
                        child:  Center(
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                              itemCount: controller.latestJobList.length,
                              separatorBuilder:
                                  (context, index) {
                                return SizedBox(
                                  width: 15,
                                );
                              },
                              itemBuilder: (BuildContext context , index){
                              var data = controller.latestJobList[index];
                                return Container(
                                  height: MediaQuery.of(context).size.height * .3,


                                  child: Center(
                                    child: badges.Badge(
                                      badgeStyle: badges.BadgeStyle(
                                        badgeColor: Colors.grey,
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      badgeContent: Icon(Icons.favorite_outline, color: Colors.white, size: 22,),
                                      child: Card(
                                        elevation: 5,

                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * .25,
                                            width: MediaQuery.of(context).size.width * .45,
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

                                                    controller.jobURL.value = data.jobUrl!;
                                                    controller.callWebController();
                                                    Get.to(JobDetailsWebView());
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

                                      )
                                    ),
                                  ),
                                );
                              }),
                        ),
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
