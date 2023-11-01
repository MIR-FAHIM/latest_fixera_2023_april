import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/modules/web_view/job_details/job_details_webview.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';

import '../../../services/auth_services.dart';

class SeeVendorProfile extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text("Full Profile"),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      body: Obx(() {
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
                    width: MediaQuery.of(context).size.width * 9,
                    color: Colors.grey.shade100,
                    child: Center(
                      child: Text("CCS Asia"),
                      // child: Image.asset(
                      //   "images/fixera_logo.png",
                      //   height: 120,
                      //   width: 120,
                      // ),
                    ),
                  ),
                  ListTile(
                    title: controller.vendorName.value.isEmpty? Text("No Data") : Text(controller.vendorName.value),
                    subtitle: Get.find<AuthService>().currentUser.value.userInfo!.roleName ==
                        "contractor" ? Text("Contractor"):Text("Vendor") ,
                    leading: Image.asset("images/icons/user.png", height: 100,width: 100,),
                    // trailing:  CircleAvatar(
                    //   radius: 14,
                    //   backgroundColor: Colors.grey,
                    //   child: Icon(
                    //     Icons.favorite_outlined,
                    //     color: Colors.white,
                    //     size: 15,
                    //   ),
                    // ),
                  ),
                  SizedBox(height: 10,),
                  Text("About", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    color: Colors.lightGreen.shade100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: controller.vendorAbout.value.isEmpty ? Text("No Data"): Text(controller.vendorAbout.value,
                      maxLines: 5,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Jobs", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Obx(
                       () {
                        return Container(
                          height: MediaQuery.of(context).size.height * .7,
                          width: MediaQuery.of(context).size.width,
                          child: controller.vendorJobList.length == 0 ? Center(child: Text("No Data")):ListView.builder(
                              itemCount: controller.vendorJobList.length,
                              itemBuilder: (BuildContext context, index) {
                                var data = controller.vendorJobList[index];

                                   return Card(
                                      elevation: 5,
                                      child: Obx(
                                        () {
                                          return Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: badges.Badge(
                                              badgeStyle: badges.BadgeStyle(
                                                badgeColor: data.isFavourite == true
                                                    ? Colors.red.withOpacity(.7)
                                                    : Colors.green,
                                                borderRadius: BorderRadius.circular(0),
                                              ),
                                              badgeContent: InkWell(
                                                onTap: (){
                                                  controller.makeFavCOntroller(

                                                      data.employer, data.id, "saved_jobs");
                                                },
                                                child: Icon(
                                                  Icons.favorite_outlined,
                                                  color: Colors.white,

                                                  size: 15,
                                                ),
                                              ),
                                              child: Center(
                                                child: Container(
                                                  height:
                                                      MediaQuery.of(context).size.height *
                                                          .4,
                                                  width: MediaQuery.of(context).size.width *
                                                      .4,
                                                  child: Column(
                                                    children: [
                                                      Container(

                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
                                                            Row(
                                                              //  mainAxisAlignment: MainAxisAlignment.start,
                                                              children: [
                                                                Icon(
                                                                  Icons.verified_user,
                                                                  color: Colors.green,
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  data.employer!,
                                                                  style:
                                                                  TextStyle(fontSize: 14),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              //mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Icon(Icons.title,
                                                                    color: Colors.green),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  data.title!,
                                                                  style:
                                                                  TextStyle(fontSize: 14),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              //mainAxisAlignment: MainAxisAlignment.center,

                                                              children: [
                                                                Icon(Icons.price_check,
                                                                    color: Colors.green),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  data.price!.toString(),
                                                                  style:
                                                                  TextStyle(fontSize: 14),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              //mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Icon(Icons.location_on_outlined,
                                                                    color: Colors.green),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  data.location!,
                                                                  style:
                                                                  TextStyle(fontSize: 14),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              //mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Icon(Icons.copy,
                                                                    color: Colors.green),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  data.type!,
                                                                  style:
                                                                  TextStyle(fontSize: 14),
                                                                ),
                                                              ],
                                                            ),
                                                            Row(
                                                              // mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Icon(Icons.punch_clock_rounded,
                                                                    color: Colors.green),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Text(
                                                                  data.duration!,
                                                                  style:
                                                                  TextStyle(fontSize: 14),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),

                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Get.find<AuthService>().currentUser.value.userInfo!.roleName == "contractor" ?
                                                      InkWell(
                                                        onTap: () {
                                                          if (data.paymentStatus ==
                                                              1) {
                                                            controller.jobURL.value =
                                                            data.jobUrl!;
                                                            controller
                                                                .callWebController();
                                                            Get.to(
                                                                JobDetailsWebView(controller.jobURL.value));
                                                          } else {
                                                            controller.jobURL.value =
                                                            data.jobUrl!;
                                                            controller
                                                                .callWebController();
                                                            Get.to(
                                                                JobDetailsWebView(controller.jobURL.value));
                                                           // controller.checkPaymentStatus(id: data.id, slug: data.slug, status: data.paymentStatus);
                                                            // controller
                                                            //     .callPublicController(
                                                            //         data.slug
                                                            //             .toString(),
                                                            //         data.id!,
                                                            //         "public");
                                                          }

                                                        },
                                                        child: AnimatedContainer(
                                                          duration: Duration(seconds: 2),
                                                          height: 30,
                                                          width: 100,
                                                          decoration: BoxDecoration(
                                                            color:  data.paymentStatus ==
                                                                  1
                                                                  ? Colors.purple
                                                                  .withOpacity(.6)
                                                                  : AppColors
                                                                  .textColorGreen,

                                                              borderRadius:
                                                                  BorderRadius.circular(
                                                                      10)),
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
                                                      ) : Container(),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                      ),
                                    );

                              }),
                        );
                      }
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
