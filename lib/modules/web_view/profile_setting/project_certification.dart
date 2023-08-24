import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
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





class ProjectCertificationWebView extends StatefulWidget {
  @override
  _InAppWebViewExampleScreenState createState() =>
      new _InAppWebViewExampleScreenState();
}

class _InAppWebViewExampleScreenState extends State<ProjectCertificationWebView> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;


  PullToRefreshController? pullToRefreshController;

  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  double _progress = 0;
  late InAppWebViewController  inAppWebViewController;

  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
      onWillPop: ()async{
        var isLastPage = await inAppWebViewController.canGoBack();
        if(isLastPage){
          inAppWebViewController.goBack();
          return false;
        } else {
          Get.offAllNamed(Routes.BASE);
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text("Project Certification"),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              InAppWebView(
                initialOptions :InAppWebViewGroupOptions(

                    crossPlatform: InAppWebViewOptions(

                      transparentBackground: true,
                    )
                ),
                //
                initialUrlRequest: URLRequest(
                    url: Uri.parse(ApiUrl.project_certification + Get.find<AuthService>().apiToken)
                ),
                onWebViewCreated: (InAppWebViewController controller){
                  inAppWebViewController = controller;
                },
                onProgressChanged: (InAppWebViewController controller , int progress){
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              _progress < 1 ? Container(
                child: LinearProgressIndicator(
                  value: _progress,
                ),
              ):SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}