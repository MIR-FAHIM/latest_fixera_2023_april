import 'dart:io';

import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:latest_fixera_2023/modules/web_view/buy_credit_web/buy_credit_web.dart';
import 'package:latest_fixera_2023/modules/web_view/how_its_work_web/how_its_work_web.dart';
import 'package:latest_fixera_2023/modules/web_view/lead/lead_tab_web.dart';
import 'package:latest_fixera_2023/modules/web_view/manage_account_web/manage_account_web.dart';
import 'package:latest_fixera_2023/modules/web_view/message_center_web/message_center_webview.dart';
import 'package:latest_fixera_2023/modules/web_view/my_saved_items_web/my_saved_item_web.dart';
import 'package:latest_fixera_2023/modules/web_view/packages/packages_web.dart';
import 'package:latest_fixera_2023/modules/web_view/profile_setting/deactivate_account.dart';
import 'package:latest_fixera_2023/modules/web_view/profile_setting/email_notification.dart';
import 'package:latest_fixera_2023/modules/web_view/profile_setting/email_sent.dart';
import 'package:latest_fixera_2023/modules/web_view/profile_setting/payment_setting.dart';
import 'package:latest_fixera_2023/modules/web_view/profile_setting/personal_details_skills.dart';
import 'package:latest_fixera_2023/modules/web_view/profile_setting/project_certification.dart';
import 'package:latest_fixera_2023/modules/web_view/profile_setting/vendor_profile_web.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_ongoing_web_view.dart';
import 'package:latest_fixera_2023/modules/web_view/proposal/proposal_web.dart';
import 'package:latest_fixera_2023/modules/web_view/transfer_history_web.dart';
import 'package:latest_fixera_2023/modules/web_view/wallet/wallet_tabbar_view.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/widget/custom_drawer_tile.dart';
import 'package:expandable/expandable.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../modules/home/controller/home_view_controller.dart';
import '../modules/web_view/dash_board/view/dashboard_view.dart';
import '../modules/web_view/invoice_web/invoice_webview.dart';
import '../modules/web_view/profile_setting/experience_education.dart';
import '../modules/web_view/project_web/project_tab.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var controller = Get.find<HomeViewController>();
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
                            Get.find<AuthService>()
                                        .currentUser
                                        .value
                                        .userInfo!
                                        .avatar ==
                                    "0"
                                ? CircleAvatar(
                                    backgroundColor: AppColors.primaryColor,
                                    radius: 30,
                                    // backgroundColor: AppColors.primaryColor,
                                    child: Image.asset(
                                      "images/icons/user.png",
                                    ),
                                  )
                                : Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: AppColors.ccsYelow, width: 2),
                                      color: AppColors.ccsYelow,
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: Get.find<AuthService>()
                                          .currentUser
                                          .value
                                          .userInfo!
                                          .avatar,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) =>
                                          const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Image(
                                          image: AssetImage(
                                            'images/img.png',
                                          ),
                                        ),
                                      ),
                                      errorWidget: (context, url, error) =>
                                          const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Image(
                                          image: AssetImage('images/img.png'),
                                        ),
                                      ),
                                    ),
                                  ),
                            Container(
                              width: Get.width * .4,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: Get.height * .06,
                                  ),
                                  Text(
                                    "${Get.find<AuthService>().currentUser.value.userInfo!.firstName}" +
                                        " ${Get.find<AuthService>().currentUser.value.userInfo!.lastName}",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 16),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (Get.find<AuthService>()
                                              .currentUser
                                              .value
                                              .userInfo!
                                              .roleName ==
                                          "contractor") {
                                        controller
                                            .seeContractorProfileController(
                                                159);
                                      } else {
                                        controller
                                            .seeVendorProfileController(159);
                                      }
                                    },
                                    child: Text(
                                      "Profile",
                                      style: TextStyle(
                                          color: Colors.blue, fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            ),
            Get.find<AuthService>().currentUser.value.userInfo!.roleName ==
                    "contractor"
                ? Container(
                    child: Column(
                      children: [
                        NavDrawerTile(
                          navIcon: Icons.dashboard,
                          navTitle: 'DashBoard',
                          onNavPress: () {
                            Get.to(DashboardWebView());
                          },
                        ),

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
                            Get.to(ProjectTabBar(0));
                          },
                        ),
                        NavDrawerTile(
                          navIcon: Icons.person_pin_outlined,
                          navTitle: 'Proposals',
                          onNavPress: () {
                            Get.to(ProposalWebView());
                          },
                        ),
                        //
                        NavDrawerTile(
                          navIcon: Icons.wallet_giftcard_sharp,
                          navTitle: 'Wallet',
                          onNavPress: () {
                            Get.to(WalletTabBar());
                          },
                        ),
                        NavDrawerTile(
                          navIcon: Icons.payments_outlined,
                          navTitle: 'Invoices',
                          onNavPress: () {
                            Get.to(InvoiceWebView());
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
                            Get.toNamed(Routes.CREATEWORKORDER);
                          },
                        ),
                        NavDrawerTile(
                          navIcon: Icons.payments_outlined,
                          navTitle: 'Create Invoice',
                          onNavPress: () {
                            Get.toNamed(Routes.CREATEINVOICE);
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
                        // NavDrawerTile(
                        //   navIcon: Icons.credit_card,
                        //   navTitle: 'Buy Credit',
                        //   onNavPress: () {
                        //     Get.toNamed(Routes.CREDITLIST);
                        //   //  Get.to(BuyCreditWebView());
                        //   },
                        // ),
                        // NavDrawerTile(
                        //   navIcon: Icons.grain,
                        //   navTitle: 'Packages',
                        //   onNavPress: () {
                        //     Get.toNamed(Routes.PACKAGELIST);
                        //    // Get.to(PackagesWebView());
                        //   },
                        // ),

                        NavDrawerTile(
                          navIcon: Icons.favorite,
                          navTitle: 'My Saved Items',
                          onNavPress: () {
                            Get.toNamed(Routes.SAVEDLIST);
                          },
                        ),

                        NavDrawerTile(
                          navIcon: Icons.screen_share,
                          navTitle: 'Referrals',
                          onNavPress: () {
                            Get.toNamed(Routes.REFFERAL);
                          },
                        ),
                        NavDrawerTile(
                          navIcon: Icons.dashboard,
                          navTitle: 'How Its work',
                          onNavPress: () {
                            Get.to(HowItsWorkWebView());
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
                            collapsed: const SizedBox(
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
                                      //Get.to(PersonalDetailsWebView());

                                      Route route = MaterialPageRoute(
                                          builder: (c) =>
                                              PersonalDetailsWebView());
                                      Navigator.pushReplacement(context, route);
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
                                      Get.to(ExperienceAndEduWebView());
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
                                      Get.to(ProjectCertificationWebView());
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
                                      Get.to(PaymentSettingWebView());
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
                                      Get.toNamed(Routes.SENDMAIL);
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
                            collapsed: const SizedBox(
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
                                      Get.to(ManageAccountWebView());
                                    },
                                    child: Text(
                                      "Manage Account",
                                      softWrap: true,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(EmailNotificationWebView());
                                    },
                                    child: Text(
                                      "Email Notification",
                                      softWrap: true,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(DeactivateWebView());
                                    },
                                    child: Text(
                                      "Delete Account ",
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
                            Get.toNamed(Routes.CHANGEPASS);
                            // Route route = MaterialPageRoute(
                            //     builder: (c) => ChangePasswordScreen());
                            // Navigator.pushReplacement(context, route);
                          },
                        ),

                        NavDrawerTile(
                          navIcon: Icons.logout,
                          navTitle: 'Logout',
                          onNavPress: () async {
                            Get.find<AuthService>().removeCurrentUser();
                            Get.find<AuthService>().removeRefCode();

                            Get.toNamed(Routes.SPLASHSCREEN);
                          },
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        NavDrawerTile(
                          navIcon: Icons.dashboard,
                          navTitle: 'DashBoard',
                          onNavPress: () {
                            Get.to(DashboardWebView());
                          },
                        ),

                        NavDrawerTile(
                          navIcon: Icons.loyalty,
                          navTitle: 'Post a Lead',
                          onNavPress: () {
                            Get.toNamed(Routes.POSTPROJECT);
                          },
                        ),
                        NavDrawerTile(
                          navIcon: Icons.post_add,
                          navTitle: 'Leads',
                          onNavPress: () {
                            Get.to(LeadTabBar());
                          },
                        ),
                        NavDrawerTile(
                          navIcon: Icons.wallet_giftcard_sharp,
                          navTitle: 'Wallet',
                          onNavPress: () {
                            Get.to(WalletTabBar());
                          },
                        ),
                        // NavDrawerTile(
                        //   navIcon: Icons.grain,
                        //   navTitle: 'Packages',
                        //   onNavPress: () {
                        //     Get.toNamed(Routes.PACKAGELIST);
                        //     // Get.to(PackagesWebView());
                        //   },
                        // ),
                        // NavDrawerTile(
                        //   navIcon: Icons.payments_outlined,
                        //   navTitle: 'Transfer History',
                        //   onNavPress: () {
                        //     Get.to(TransferWebView());
                        //   },
                        // ),

                        NavDrawerTile(
                          navIcon: Icons.payments_outlined,
                          navTitle: 'Invoices',
                          onNavPress: () {
                            Get.to(InvoiceWebView());
                          },
                        ),

                        NavDrawerTile(
                          navIcon: Icons.favorite,
                          navTitle: 'My Saved Items',
                          onNavPress: () {
                            Get.toNamed(Routes.SAVEDLIST);
                          },
                        ),
                        NavDrawerTile(
                          navIcon: Icons.screen_share,
                          navTitle: 'Referrals',
                          onNavPress: () {
                            Get.toNamed(Routes.REFFERAL);
                          },
                        ),
                        NavDrawerTile(
                          navIcon: Icons.dashboard,
                          navTitle: 'How Its work',
                          onNavPress: () {
                            Get.to(HowItsWorkWebView());
                          },
                        ),

                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: ExpandablePanel(
                            collapsed: const SizedBox(
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
                                  Get.find<AuthService>()
                                              .currentUser
                                              .value
                                              .userInfo!
                                              .roleName ==
                                          "contractor"
                                      ? SizedBox(
                                          child: Column(
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
                                        )
                                      : SizedBox(
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  Get.to(VendorProfileWeb());

                                                  // Route route = MaterialPageRoute(
                                                  //     builder: (c) =>
                                                  //         ContractorPersonalDetailSCreen());
                                                  // Navigator.pushReplacement(context, route);
                                                },
                                                child: Text(
                                                  "Manage Profile",
                                                  softWrap: true,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  Get.to(PaymentSettingWebView());
                                                },
                                                child: Text(
                                                  "Payment Settings",
                                                  softWrap: true,
                                                ),
                                              ),
                                            ],
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
                            collapsed: const SizedBox(
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
                                      Get.to(ManageAccountWebView());
                                    },
                                    child: Text(
                                      "Manage Account",
                                      softWrap: true,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.to(EmailNotificationWebView());
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
                                      Get.to(DeactivateWebView());

                                      // Get.toNamed(
                                      //  AppRoutes.DEACTIVATE_ACCOUNT);
                                    },
                                    child: Text(
                                      "Delete Account ",
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
                            Get.toNamed(Routes.CHANGEPASS);
                            // Route route = MaterialPageRoute(
                            //     builder: (c) => ChangePasswordScreen());
                            // Navigator.pushReplacement(context, route);
                          },
                        ),

                        NavDrawerTile(
                          navIcon: Icons.logout,
                          navTitle: 'Logout',
                          onNavPress: () async {
                            Get.find<AuthService>().removeCurrentUser();
                            Get.toNamed(Routes.SPLASHSCREEN);
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
