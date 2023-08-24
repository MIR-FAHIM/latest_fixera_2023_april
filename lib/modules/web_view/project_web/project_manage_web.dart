import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:get/get.dart';

import '../../../utils/AppColors/app_colors.dart';


class ProjectManageWebView extends StatefulWidget {
  @override
  _projectManageWebViewClassState createState() => _projectManageWebViewClassState();
}

class _projectManageWebViewClassState extends State<ProjectManageWebView> {
  double _progress = 0;
  late InAppWebViewController  inAppWebViewController;
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(Colors.white)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) async {



        },
        onPageFinished: (String url) {


        },
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {

          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(Uri.parse(Get.find<AuthService>().currentUser.value.userInfo!.roleName == "contractor"
        ?ApiUrl.contractorManageJobsUrl+Get.find<AuthService>().apiToken
    : ApiUrl.leadManageJobsUrl+Get.find<AuthService>().apiToken));
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

        backgroundColor: Colors.white,

        body:Stack(
          children: [
            InAppWebView(
              initialOptions :InAppWebViewGroupOptions(

                  crossPlatform: InAppWebViewOptions(

                    transparentBackground: true,
                  )
              ),
              //
              initialUrlRequest: URLRequest(
                  url: Get.find<AuthService>().currentUser.value.userInfo!.roleName == "contractor" ?
                  Uri.parse(ApiUrl.contractorManageJobsUrl+Get.find<AuthService>().apiToken) :  Uri.parse(ApiUrl.leadManageJobsUrl+Get.find<AuthService>().apiToken)
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