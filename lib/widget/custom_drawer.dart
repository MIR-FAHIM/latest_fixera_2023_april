import 'dart:io';

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:latest_fixera_2023/modules/web_view/message_center_web/message_center_webview.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/widget/custom_drawer_tile.dart';
import 'package:expandable/expandable.dart';

import '../modules/web_view/dash_board/view/dashboard_view.dart';

class NavDrawer extends StatelessWidget {



  @override
  Widget build(BuildContext context) {


    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [





            Center(
              child: Container(
                color: Colors.grey[300],
                height: Get.height * 0.2,
                width: Get.width,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Get.find<AuthService>().currentUser.value.userInfo!.avatar == "0"?
                             CircleAvatar(
                               backgroundColor: AppColors.primaryColor,
                               radius: 30,
                              // backgroundColor: AppColors.primaryColor,
                               child: Image.asset("images/icons/user.png", ),
                             ) : CircleAvatar(
                            radius: 30,
                            backgroundColor: AppColors.primaryColor,
                            child: Image.network(Get.find<AuthService>().currentUser.value.userInfo!.avatar),
                          ),
                          Container(
                            width: 100,
                            child: Column(
                              children: [
                                SizedBox(height: Get.height*.06,),
                                Text("${Get.find<AuthService>().currentUser.value.userInfo!.firstName}",
                                  style: TextStyle(color: Colors.black, fontSize: 16),),
                                Text("${Get.find<AuthService>().currentUser.value.userInfo!.lastName}",
                                  style: TextStyle(color: Colors.black),),
                                Text("Profile", style: TextStyle(color: Colors.blue, fontSize: 16),),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )

              ),
            ),

        Container(
              child: Column(
                children: [
                  NavDrawerTile(
                    navIcon: Icons.dashboard,
                    navTitle: 'DashBoard',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  NavDrawerTile(
                    navIcon: Icons.message_outlined,
                    navTitle: 'Message Center',
                    onNavPress: () {
                    Get.to(MessageCenterWebView());
                    },
                  ),
                  //   NavDrawerTile(
                  //   navIcon: Icons.message,
                  //   navTitle: 'Check file',
                  //   onNavPress: () {
                  //     Get.toNamed(AppRoutes.CHECKFILE);
                  //   },

                  // ),

                  NavDrawerTile(
                    navIcon: Icons.loyalty,
                    navTitle: 'Post a Project',
                    onNavPress: () {
                      Get.toNamed(Routes.POSTPROJECT);
                    },
                  ),
                  NavDrawerTile(
                    navIcon: Icons.post_add,
                    navTitle: 'Projects',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  NavDrawerTile(
                    navIcon: Icons.person_pin_outlined,
                    navTitle: 'Proposals',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),

                  NavDrawerTile(
                    navIcon: Icons.wallet_giftcard_sharp,
                    navTitle: 'Wallet',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  NavDrawerTile(
                    navIcon: Icons.payments_outlined,
                    navTitle: 'Invoices',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  NavDrawerTile(
                    navIcon: Icons.payments_outlined,
                    navTitle: 'Create Estimations',
                    onNavPress: () {
                      Get.toNamed(Routes.CREATEESTIMATION);
                    },
                  ),
                  NavDrawerTile(
                    navIcon: Icons.payments_outlined,
                    navTitle: 'Create work order',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  NavDrawerTile(
                    navIcon: Icons.payments_outlined,
                    navTitle: 'Create Invoice',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  // NavDrawerTile(
                  //   navIcon: Icons.grain,
                  //   navTitle: 'In App purchase',
                  //   onNavPress: () {
                  //     Route route =
                  //     MaterialPageRoute(builder: (c) => MyPayApp());
                  //     Navigator.pushReplacement(context, route);
                  //   },
                  // ),
                  NavDrawerTile(
                    navIcon: Icons.credit_card,
                    navTitle: 'Buy Credit',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  NavDrawerTile(
                    navIcon: Icons.grain,
                    navTitle: 'Packages',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),

                  NavDrawerTile(
                    navIcon: Icons.favorite,
                    navTitle: 'My Saved Items',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  NavDrawerTile(
                    navIcon: Icons.dashboard,
                    navTitle: 'How Its work',
                    onNavPress: () {
                      Get.toNamed(Routes.HOME);
                    },
                  ),
                  NavDrawerTile(
                    navIcon: Icons.how_to_reg,
                    navTitle: 'DashBoard',
                    onNavPress: () {
                     Get.to(WebViewClass());
                    },
                  ),
                  // NavDrawerTile(
                  //   navIcon: Icons.settings,
                  //   navTitle: 'Settings',
                  //   onNavPress: () {
                  //     Get.toNamed(AppRoutes.SETTINGSWEB);
                  //   },
                  // ),

                  /* NavDrawerTile(
                          navIcon: Icons.settings,
                          navTitle: 'Profile Setting',
                          onNavPress: () {
                            print("Profile Setting");
                            Get.toNamed(AppRoutes.PROFILE_SETTINGS);
                          },
                        ),*/

                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ExpandablePanel(
                      collapsed:
                      const SizedBox(
                        height: 10,
                      ),
                      header: NavDrawerTile(
                        navIcon: Icons.settings,
                        navTitle: 'Profile Setting',
                      ),
                      expanded: Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {


                                // Route route = MaterialPageRoute(
                                //     builder: (c) =>
                                //         ContractorPersonalDetailSCreen());
                                // Navigator.pushReplacement(context, route);
                              },
                              child: Text(
                                "Personal Details & Skills",
                                softWrap: true,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // Route route = MaterialPageRoute(
                                //     builder: (c) =>
                                //         ContractorExperienceEduInappwebview());
                                // Navigator.pushReplacement(context, route);
                              },
                              child: Text(
                                "Experience & Education",
                                softWrap: true,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // Route route = MaterialPageRoute(
                                //     builder: (c) =>
                                //         ContractorProjectsCertificationInappWebView());
                                // Navigator.pushReplacement(context, route);

                                // Route route = MaterialPageRoute(
                                //     builder: (c) =>
                                //         ContractorProjectAndCertificateScreen());
                                // Navigator.pushReplacement(context, route);
                              },
                              child: Text(
                                "Projects & Certifications",
                                softWrap: true,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // Route route = MaterialPageRoute(
                                //     builder: (c) =>
                                //         ContractorPaymentInappwebview());
                                // Navigator.pushReplacement(context, route);
                              },
                              child: Text(
                                "Payment Settings",
                                softWrap: true,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                                // Get.to(() => SendEmailView());
                              },
                              child: Text(
                                "Email Send",
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: ExpandablePanel(
                      collapsed:
                      const SizedBox(
                        height: 10,
                      ),
                      header: NavDrawerTile(
                        navIcon: Icons.settings,
                        navTitle: 'Account Setting',
                        onNavPress: () {
                          // Get.toNamed(AppRoutes.ACCOUNT_SETTINGS);
                        },
                      ),
                      expanded: Padding(
                        padding: const EdgeInsets.only(left: 100),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            InkWell(
                              onTap: () {
                               // Get.toNamed(AppRoutes.EMAIL_ACCOUNT);
                              },
                              child: Text(
                                "Email Notification ",
                                softWrap: true,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              onTap: () {
                               // Get.toNamed(
                                //  AppRoutes.DEACTIVATE_ACCOUNT);
                              },
                              child: Text(
                                "De-active Account ",
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // NavDrawerTile(
                  //   navIcon: Icons.lock,
                  //   navTitle: 'Test',
                  //   onNavPress: () {
                  //     Route route = MaterialPageRoute(
                  //         builder: (c) => TestMyApp());
                  //     Navigator.pushReplacement(context, route);
                  //   },
                  // ),
                  NavDrawerTile(
                    navIcon: Icons.lock,
                    navTitle: 'Change Password',
                    onNavPress: () {
                      // Route route = MaterialPageRoute(
                      //     builder: (c) => ChangePasswordScreen());
                      // Navigator.pushReplacement(context, route);
                    },
                  ),

                  NavDrawerTile(
                    navIcon: Icons.logout,
                    navTitle: 'Logout',
                    onNavPress: () async {

                    },
                  ),
                ],
              ),
            )


          ],
        ),
      ),
    );
  }
}
