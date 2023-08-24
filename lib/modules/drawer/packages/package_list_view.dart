import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/buy_credit/controller/buy_credit_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/controller/create_estimation_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/controller/post_project_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';

class PackagesListView extends GetView<BuyCreditController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Packages"),
        backgroundColor: AppColors.ccsYelow,
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() {
        return SingleChildScrollView(
            child: Column(
          children: [
            controller.packageList.value == null
            ? Center(
              child: CircularProgressIndicator(),
            )
            :Container(
              height: MediaQuery.of(context).size.height * .6,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.packageList.value.length,
                  itemBuilder: (c, i) {
                    var data = controller.packageList.value[i];
                    return Card(
                      color: Colors.black.withOpacity(.7),
                      shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(6),),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Center(
                            child: Image.asset("images/ccsasiabanner.png",
                              height: 100, width: MediaQuery.of(context).size.width*.7, fit: BoxFit.contain,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(data.title, style: MyTextSample.button(context)!.copyWith(color: MyColorsSample.grey_20)),
                                Container(height: 5),
                                Text(data.subtitle, style: MyTextSample.headline(context)!.copyWith(color: Colors.white)),
                                Container(height: 15),
                                Text("Cost: ${data.cost}", style: TextStyle(fontSize: 22, color: AppColors.ccsYelow)),
                                Container(height: 15),
                                Text("No of connect: ${data.options.noOfConnects}", style: TextStyle(fontSize: 15, color: Colors.white)),
                                Container(height: 15),
                                Text("No of jobs: ${data.options.jobs}", style: TextStyle(fontSize: 15, color: Colors.white)),
                                Container(height: 15),
                                Text("No of Featured jobs: ${data.options.featuredJobs}", style: TextStyle(fontSize: 15, color: Colors.white)),

                                Container(height: 60),


                              ],
                            ),
                          ),
                          controller.packageModel.value.results!.isAlreadyPurchase == false || controller.packageModel.value.results!.isPendingRequest == false
                        ?   InkWell(
                            onTap: () async {
                              controller.buyPackageController(data.id);
                            },
                            child: Center(
                              child: AnimatedContainer(
                                duration: Duration(seconds: 2),
                                height: controller.visible.value == 1 ? 50 : 60,
                                width: controller.visible.value == 1 ? 50 : 140,
                                decoration: BoxDecoration(
                                    color: AppColors.ccsYelow,
                                    borderRadius: BorderRadius.circular(
                                        controller.visible.value == 1 ? 60 : 10)),
                                alignment: Alignment.center,
                                child: controller.visible.value == 1
                                    ? Center(child: CircularProgressIndicator())
                                    : Text(
                                  "Buy Package",
                                  style: TextStyle(
                                    color: AppColors.backgroundColor,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          )
                          : Container(),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
      }),
    );
  }
}
class MyColorsSample {
  static const Color primary = Color(0xFF12376F);
  static const Color primaryDark = Color(0xFF0C44A3);
  static const Color primaryLight = Color(0xFF43A3F3);
  static const Color green = Colors.green;
  static Color black = const Color(0xFF000000);
  static const Color accent = Color(0xFFFF4081);
  static const Color accentDark = Color(0xFFF50057);
  static const Color accentLight = Color(0xFFFF80AB);
  static const Color grey_3 = Color(0xFFf7f7f7);
  static const Color grey_5 = Color(0xFFf2f2f2);
  static const Color grey_10 = Color(0xFFe6e6e6);
  static const Color grey_20 = Color(0xFFcccccc);
  static const Color grey_40 = Color(0xFF999999);
  static const Color grey_60 = Color(0xFF666666);
  static const Color grey_80 = Color(0xFF37474F);
  static const Color grey_90 = Color(0xFF263238);
  static const Color grey_95 = Color(0xFF1a1a1a);
  static const Color grey_100_ = Color(0xFF0d0d0d);
  static const Color transparent = Color(0x00f7f7f7);
}
class MyTextSample{

  static TextStyle? display4(BuildContext context){
    return Theme.of(context).textTheme.displayLarge;
  }

  static TextStyle? display3(BuildContext context){
    return Theme.of(context).textTheme.displayMedium;
  }

  static TextStyle? display2(BuildContext context){
    return Theme.of(context).textTheme.displaySmall;
  }

  static TextStyle? display1(BuildContext context){
    return Theme.of(context).textTheme.headlineMedium;
  }

  static TextStyle? headline(BuildContext context){
    return Theme.of(context).textTheme.headlineSmall;
  }

  static TextStyle? title(BuildContext context){
    return Theme.of(context).textTheme.titleLarge;
  }

  static TextStyle medium(BuildContext context){
    return Theme.of(context).textTheme.titleMedium!.copyWith(
      fontSize: 18,
    );
  }

  static TextStyle? subhead(BuildContext context){
    return Theme.of(context).textTheme.titleMedium;
  }

  static TextStyle? body2(BuildContext context){
    return Theme.of(context).textTheme.bodyLarge;
  }

  static TextStyle? body1(BuildContext context){
    return Theme.of(context).textTheme.bodyMedium;
  }

  static TextStyle? caption(BuildContext context){
    return Theme.of(context).textTheme.bodySmall;
  }

  static TextStyle? button(BuildContext context){
    return Theme.of(context).textTheme.labelLarge!.copyWith(
        letterSpacing: 1
    );
  }

  static TextStyle? subtitle(BuildContext context){
    return Theme.of(context).textTheme.titleSmall;
  }

  static TextStyle? overline(BuildContext context){
    return Theme.of(context).textTheme.labelSmall;
  }
}
