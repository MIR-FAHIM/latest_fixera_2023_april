import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';

class SeeVendorProfile extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<HomeViewController>();
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
                      child: Image.asset(
                        "images/fixera_logo.png",
                        height: 120,
                        width: 120,
                      ),
                    ),
                  ),
                  ListTile(
                    title: Text(controller.vendorName.value),
                    subtitle: Text("Vendor"),
                    leading: Image.asset("images/icons/user.png", height: 100,width: 100,),
                    trailing:  CircleAvatar(
                      radius: 14,
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.favorite_outlined,
                        color: Colors.white,
                        size: 15,
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("About", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Container(
                    height: 100,
                    color: Colors.lightGreen.shade100,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Text(controller.vendorAbout.value,
                      maxLines: 5,),
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Jobs", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .7,
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                          itemCount: controller.vendorJobList.length,
                          itemBuilder: (BuildContext context, index) {
                            var data = controller.vendorJobList[index];
                           return Card(
                              elevation: 5,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: badges.Badge(
                                  badgeStyle: badges.BadgeStyle(
                                    badgeColor: Colors.grey,
                                    borderRadius: BorderRadius.circular(0),
                                  ),
                                  badgeContent: Icon(
                                    Icons.favorite_outlined,
                                    color: Colors.white,
                                    size: 15,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              .24,
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
                                          InkWell(
                                            onTap: () {
                                              //controller.visible.value++;
                                            },
                                            child: AnimatedContainer(
                                              duration: Duration(seconds: 2),
                                              height: 30,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color:
                                                      AppColors.primaryColor,
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
                                          ),
                                        ],
                                      ),
                                    ),
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
      }),
    );
  }
}
