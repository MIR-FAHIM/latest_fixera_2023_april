
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';


class SplashscreenView extends GetView<SplashscreenController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<SplashscreenController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            // height: size.width * .35,
            // width: size.width * .35,
            Center(
              child: SizedBox(
                height: size.width * .5,
                width: size.width * .7,
                child: Image.asset("images/ccsasiabanner.png"),
              ),
            ),

            // Image(
            //   height: 200,
            //   width: 200,
            //   image: AssetImage(
            //     'assets/Logow.png',
            //   ),
            // ),

            Positioned(
              bottom: 10,
              right: 0,
              left: 0,
              child: Ui.customLoaderSplash(),
            )
          ],
        ),
      ),
    );
  }
}
