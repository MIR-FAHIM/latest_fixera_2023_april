import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/base/controller/base_view_controller.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';
import 'package:latest_fixera_2023/widget/custom_drawer.dart';


class BaseView extends GetView<BaseController> {
  const BaseView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: controller.currentPage,
        extendBody: true,
        // floatingActionButton: Container(
        //   height: 70.0,
        //   width: 70.0,
        //   decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
        //   child: FittedBox(
        //     child: FloatingActionButton(
        //         backgroundColor: Get.theme.primaryColor,
        //         child: const Image(
        //           height: 20,
        //           width: 20,
        //           image: AssetImage('assets/home.png'),
        //           color: Colors.white,
        //         ),
        //         onPressed: () {
        //           controller.currentIndex.value = 1;
        //         }),
        //   ),
        // ),
        //   floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          notchMargin: 6,
          elevation: 10,
          shape: const AutomaticNotchedShape(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(15),
                bottom: Radius.circular(10),
              ),
            ),
            RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            height: 60,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      if (Get.find<AuthService>().isAuth) {
                        controller.currentIndex.value = 0;
                      } else {
                        Get.toNamed(Routes.LOGIN);
                      }
                    },
                    child: Container(
                      width: 70,


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.home_outlined,
                            color: controller.currentIndex.value == 0 ? AppColors.primaryColor : Colors.grey,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'Home'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 0 ? AppColors.primaryColor : Colors.grey, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){

                        controller.currentIndex.value = 1;

                    },
                    child: Container(
                      width: 70,


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.dashboard,
                            color: controller.currentIndex.value == 1 ? AppColors.primaryColor : Colors.grey,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Get.find<AuthService>().currentUser.value.userInfo!.roleName == "contractor" ?
                          Text(
                            'Browse Jobs'.tr,
                            style: TextStyle(
                              fontSize: 10,
                                color: controller.currentIndex.value == 1 ? AppColors.primaryColor : Colors.grey, fontWeight: FontWeight.normal),
                          ) : Text(
                            'Browse Leads'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 1 ? AppColors.primaryColor : Colors.grey, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),

                  GestureDetector(
                    onTap: (){
                      if (Get.find<AuthService>().isAuth) {
                        controller.currentIndex.value = 2;
                      } else {
                        Get.toNamed(Routes.LOGIN);
                      }
                    },
                    child: Container(
                      width: 70,


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.supervised_user_circle_outlined,
                            color: controller.currentIndex.value == 2 ? AppColors.primaryColor : Colors.grey,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'Contractors'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 2 ? AppColors.primaryColor : Colors.grey, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),


                  GestureDetector(
                    onTap: (){
                      if (Get.find<AuthService>().isAuth) {
                        controller.currentIndex.value = 3;
                      } else {
                        Get.toNamed(Routes.LOGIN);
                      }
                    },
                    child: Container(
                      width: 100,


                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.shopping_cart_outlined,
                            color: controller.currentIndex.value == 3 ? AppColors.primaryColor : Colors.grey,
                          ),
                          // Icon(
                          //   CupertinoIcons.home,
                          //   color: controller.currentIndex.value == 0
                          //       ? Colors.lightBlueAccent
                          //       : Colors.grey,
                          // ),
                          Text(
                            'Construction'.tr,
                            style: TextStyle(
                                fontSize: 10,
                                color: controller.currentIndex.value == 3 ? AppColors.primaryColor : Colors.grey, fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                  ),


                  // Right Tab bar icons
                ],
              ),
            ),
          ),
        ),
        drawer: NavDrawer(),
        appBar: navAppBar(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        // floatingActionButton: FloatingActionButton(
        //   backgroundColor: Colors.white,
        //   shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        //   onPressed: () {
        //     controller.currentIndex.value = 1;
        //   },
        //   child: Icon(Icons.home_outlined,
        //     color: controller.currentIndex.value == 0 ? AppColors.primaryColor : Colors.grey,
        //   ),
        // ),

        // bottomNavigationBar: BottomAppBar(
        //   shape: const CircularNotchedRectangle(),
        //   notchMargin: 8,
        //   elevation: 10,
        //   child: Container(
        //     height: 75,
        //     decoration: const BoxDecoration(
        //         borderRadius: BorderRadius.only(
        //             topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        //     child: Padding(
        //       padding: const EdgeInsets.symmetric(horizontal: 8.0),
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: <Widget>[
        //           MaterialButton(
        //             minWidth: 30,
        //             onPressed: () {
        //               controller.currentIndex.value = 0;
        //             },
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: <Widget>[
        //                 Image(
        //                   height: 20,
        //                   width: 20,
        //                   image: const AssetImage('assets/clock.png'),
        //                   color: controller.currentIndex.value == 0
        //                       ? Get.theme.primaryColor
        //                       : Colors.grey,
        //                 ),
        //                 // Icon(
        //                 //   CupertinoIcons.home,
        //                 //   color: controller.currentIndex.value == 0
        //                 //       ? Colors.lightBlueAccent
        //                 //       : Colors.grey,
        //                 // ),
        //                 Text(
        //                   'History'.tr,
        //                   style: TextStyle(
        //                       color: controller.currentIndex.value == 0
        //                           ? Get.theme.primaryColor
        //                           : Colors.grey,
        //                       fontWeight: FontWeight.normal),
        //                 ),
        //               ],
        //             ),
        //           ),
        //           MaterialButton(
        //             minWidth: 30,
        //             onPressed: () {
        //               controller.currentIndex.value = 2;
        //             },
        //             child: Column(
        //               mainAxisAlignment: MainAxisAlignment.center,
        //               children: <Widget>[
        //                 Image(
        //                   height: 20,
        //                   width: 20,
        //                   image: const AssetImage('assets/settings.png'),
        //                   color: controller.currentIndex.value == 2
        //                       ? Get.theme.primaryColor
        //                       : Colors.grey,
        //                 ),
        //                 // Icon(
        //                 //   CupertinoIcons.chat_bubble_2_fill,
        //                 //   color: controller.currentIndex.value == 1
        //                 //       ? Colors.lightBlueAccent
        //                 //       : Colors.grey,
        //                 // ),
        //                 Text(
        //                   'Settings'.tr,
        //                   style: TextStyle(
        //                       color: controller.currentIndex.value == 2
        //                           ? Get.theme.primaryColor
        //                           : Colors.grey,
        //                       fontWeight: FontWeight.normal),
        //                 ),
        //               ],
        //             ),
        //           )
        //
        //           // Right Tab bar icons
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
      );
    });
  }
}
