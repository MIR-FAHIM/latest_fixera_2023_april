import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
//import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:new_version_plus/new_version_plus.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';

import '../../drawer/post_a_project/controller/post_project_controller.dart';

class JobDetailsWebView extends GetView<HomeViewController> {
  @override



  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _goBack(context),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text("Job Details"),
          centerTitle: true,

        ),
        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery
                  .of(context)
                  .size
                  .height * .047,),
              Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 4,
                  child: WebViewWidget(controller: controller.webController)
              ),
            ],
          ),
        ),
      ),
    );
  }


  Future<bool> _goBack(BuildContext context) async {
    if (await controller.webController.canGoBack()) {
      controller.webController.goBack();
      return Future.value(false);
    } else {
      Get.offAllNamed(Routes.BASE);
      return Future.value(true);
    }
  }
}