
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/my_saved_item/controller/saved_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/modules/web_view/job_details/job_details_webview.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';


class MySavedViewScreen extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(

      appBar: AppBar(
        title: Text("My Saved Items"),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Obx(
              () {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.width *8,
                        color: Colors.white,
                        child: Row(
                          children: [

                            Checkbox(
                              value: controller.contractorChecked.value,
                              onChanged: ( newValue) {
                                controller.contractorChecked.value = newValue!;
                                controller.marketPlaceChecked.value = false;
                                controller.brwsJobChecked.value = false;
                              },
                            ),
                            Text("Contractor", style: TextStyle(fontSize: 10),),
                            Checkbox(
                              value: controller.marketPlaceChecked.value,
                              onChanged: ( newValue) {
                                controller.marketPlaceChecked.value = newValue!;
                                controller.contractorChecked.value = false;
                                controller.brwsJobChecked.value = false;
                              },
                            ),
                            Text("Construction",style: TextStyle(fontSize: 10)),
                            Checkbox(
                              value: controller.brwsJobChecked.value,

                              onChanged: ( newValue) {
                                controller.brwsJobChecked.value = newValue!;
                                controller.contractorChecked.value = false;
                                controller.marketPlaceChecked.value = false;
                              },
                            ),
                            Text("Browse Projects", style: TextStyle(fontSize: 10)),
                          ],
                        ),



                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height:MediaQuery.of(context).size.height * .8,
                          child:  controller.contractorChecked.value == true ?
                          ListView.builder(
                              itemCount: controller.mySavedItemsListJobs.length,
                              itemBuilder: (BuildContext context , index){
                                var data = controller.mySavedItemsListJobs[index];
                                return

                                  Card(
                                    elevation: 5,

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: badges.Badge(
                                        badgeStyle: badges.BadgeStyle(
                                          badgeColor: data.isFavourite == true ? Colors.red.withOpacity(.7):Colors.grey,
                                          borderRadius: BorderRadius.circular(0),
                                        ),
                                        badgeContent: Icon(Icons.favorite_outlined, color: Colors.white, size: 15,),
                                        child:

                                        Center(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * .28,
                                            width: MediaQuery.of(context).size.width * .4,
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          //  mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Icon(Icons.verified_user, color: Colors.green,),
                                                            SizedBox(width: 10,),
                                                            Text(data.employer!, style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),
                                                        Row(
                                                          //mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.title, color:Colors.green),
                                                            SizedBox(width: 10,),
                                                            Text(data.title!,style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),
                                                        Row(
                                                          //mainAxisAlignment: MainAxisAlignment.center,

                                                          children: [
                                                            Icon(Icons.price_check, color:Colors.green),
                                                            SizedBox(width: 10,),
                                                            Text(data.price!.toString(), style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),
                                                        Row(
                                                          //mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.location_on_outlined, color:Colors.green),
                                                            SizedBox(width: 10,),
                                                            Text(data.location!, style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),
                                                        Row(
                                                          //mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.copy, color:Colors.green),
                                                            SizedBox(width: 10,),
                                                            Text(data.type!,style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),
                                                        Row(
                                                          // mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.punch_clock_rounded, color:Colors.green),
                                                            SizedBox(width: 10,),
                                                            Text(data.duration!, style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(height: 20,),

                                                  InkWell(
                                                    onTap: () {
                                                      if (data.paymentStatus ==
                                                          1) {
                                                        controller.jobURL.value =
                                                        data.jobUrl!;
                                                        controller
                                                            .callWebController();
                                                        Get.to(
                                                            JobDetailsWebView());
                                                      } else {

                                                        controller.checkPaymentStatus(id: data.id, slug: data.slug, status: data.paymentStatus);
                                                        // controller
                                                        //     .callPublicController(
                                                        //         data.slug
                                                        //             .toString(),
                                                        //         data.id!,
                                                        //         "public");
                                                      }

                                                      //controller.visible.value++;
                                                    },
                                                    child: AnimatedContainer(
                                                      duration:
                                                      Duration(seconds: 2),
                                                      height: 30,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                          color: data.paymentStatus ==
                                                              1
                                                              ? Colors.purple
                                                              .withOpacity(.6)
                                                              : AppColors
                                                              .textColorGreen,
                                                          borderRadius:
                                                          BorderRadius
                                                              .circular(10)),
                                                      alignment: Alignment.center,
                                                      child: Text(
                                                        "View Job",
                                                        style: TextStyle(
                                                          color: AppColors
                                                              .backgroundColor,
                                                          fontSize: 12,
                                                        ),
                                                      ),
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),),
                                        ),


                                      ),
                                    ),




                                  );
                              })
                              : controller.marketPlaceChecked.value == true ?
                          ListView.builder(
                              itemCount: controller.mySavedFreelancerListJobs.length,
                              itemBuilder: (BuildContext context , index){
                                var data = controller.mySavedFreelancerListJobs[index];
                                return

                                  Card(
                                    elevation: 5,

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: badges.Badge(
                                        badgeStyle: badges.BadgeStyle(
                                          badgeColor: data.isFavourite == true ? Colors.red.withOpacity(.7):Colors.grey,
                                          borderRadius: BorderRadius.circular(0),
                                        ),
                                        badgeContent: Icon(Icons.favorite_outlined, color: Colors.white, size: 15,),
                                        child:

                                        Center(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * .28,
                                            width: MediaQuery.of(context).size.width * .4,
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          //  mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Icon(Icons.verified_user, color: Colors.green,),
                                                            SizedBox(width: 10,),
                                                            Text(data.name!, style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),
                                                        Row(
                                                          //mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.title, color:Colors.green),
                                                            SizedBox(width: 10,),
                                                            Text(data.tagLine!,style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),
                                                        Row(
                                                          //mainAxisAlignment: MainAxisAlignment.center,

                                                          children: [
                                                            Icon(Icons.price_check, color:Colors.green),
                                                            SizedBox(width: 10,),
                                                            Text(data.hourlyRate!.toString(), style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),
                                                        Row(
                                                          //mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.rate_review, color:Colors.green),
                                                            SizedBox(width: 10,),
                                                            Text(data.rating!, style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),


                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(height: 20,),



                                                ],
                                              ),
                                            ),),
                                        ),


                                      ),
                                    ),




                                  );
                              })
                              :
                          ListView.builder(
                              itemCount: controller.mySavedEmployerListJobs.length,
                              itemBuilder: (BuildContext context , index){
                                var data = controller.mySavedEmployerListJobs[index];
                                return

                                  Card(
                                    elevation: 5,

                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: badges.Badge(
                                        badgeStyle: badges.BadgeStyle(
                                          badgeColor: data.isFavourite == true ? Colors.red.withOpacity(.7): Colors.grey,
                                          borderRadius: BorderRadius.circular(0),
                                        ),
                                        badgeContent: Icon(Icons.favorite_outlined, color: Colors.white, size: 15,),
                                        child:

                                        Center(
                                          child: Container(
                                            height: MediaQuery.of(context).size.height * .28,
                                            width: MediaQuery.of(context).size.width * .4,
                                            child: Center(
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,

                                                children: [
                                                  Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          //  mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Icon(Icons.verified_user, color: Colors.green,),
                                                            SizedBox(width: 10,),
                                                            Text(data.name!, style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),
                                                        Row(
                                                          //mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            Icon(Icons.title, color:Colors.green),
                                                            SizedBox(width: 10,),
                                                            Text(data.tagLine!,style: TextStyle(fontSize: 14),),
                                                          ],
                                                        ),


                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(height: 20,),



                                                ],
                                              ),
                                            ),),
                                        ),


                                      ),
                                    ),




                                  );
                              }) ,
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
