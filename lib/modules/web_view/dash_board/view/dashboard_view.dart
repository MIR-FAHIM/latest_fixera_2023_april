import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
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

class WebViewClass extends StatefulWidget {
  @override
  _WebViewClassState createState() => _WebViewClassState();
}

class _WebViewClassState extends State<WebViewClass> {

  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(Colors.white)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) async {
          //https://shopbasebd.com/public/uploads/shop/products/1684647182_L_2.jpeg
          if (url.contains('https://shopbasebd.com/public/uploads/shop/products/'))  {



            final Directory tempDir = await getTemporaryDirectory();
            final taskId = await FlutterDownloader.enqueue(
              url: url,
              savedDir: tempDir.path,
              saveInPublicStorage: true,
              showNotification: true, // show download progress in status bar (for Android)
              openFileFromNotification: false, // click on notification to open downloaded file (for Android)
            );

            //   NavigationDecision.navigate;
          }
          if (url.contains('facebook.com'))  {
            Uri myUrl = Uri.parse(url);
            if(await canLaunchUrl(myUrl)){
              await launchUrl(myUrl);
            }else {
              throw 'Could not launch $url';
            }

            //   NavigationDecision.navigate;
          }
          if (url.contains('fb.com'))  {
            Uri myUrl = Uri.parse(url);
            if(await canLaunchUrl(myUrl)){
              await launchUrl(myUrl);
            }else {
              throw 'Could not launch $url';
            }

            //   NavigationDecision.navigate;
          }
          if (url.contains('youtube.com'))  {
            Uri myUrl = Uri.parse(url);
            if(await canLaunchUrl(myUrl)){
              await launchUrl(myUrl);
            }else {
              throw 'Could not launch $url';
            }

            //   NavigationDecision.navigate;
          }
          // NavigationDecision.navigate;

        },
        onPageFinished: (String url) {


        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {

          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(ApiUrl.vendorDashBoard+"?token=${Get.find<AuthService>().apiToken}"));
  void initState() {
    super.initState();


  }
  @override
  void dispose() {

    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _goBack(context),
      child: Scaffold(
        backgroundColor: Colors.deepOrange,

        body:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * .047,),
              Container(
                  height: MediaQuery.of(context).size.height * .953,
                  child: WebViewWidget(controller: controller)
              ),
            ],
          ),
        ),
      ),
    );
  }



  Future<bool> _goBack(BuildContext context) async {
    if (await controller.canGoBack()) {
      controller.goBack();
      return Future.value(false);
    } else {
      Get.offAllNamed(Routes.BASE);
      return Future.value(true);
    }
  }
}