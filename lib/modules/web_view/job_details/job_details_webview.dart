import 'package:flutter/material.dart';

import 'package:latest_fixera_2023/modules/web_view/job_details/bid_now_web.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
//import 'package:image_downloader/image_downloader.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:new_version_plus/new_version_plus.dart';

import 'package:path_provider/path_provider.dart';
import 'package:get/get.dart';



class JobDetailsWebView extends StatefulWidget {
  String? url;
  JobDetailsWebView(this.url);
  @override
  _dashboardWebViewClassState createState() => _dashboardWebViewClassState();
}

class _dashboardWebViewClassState extends State<JobDetailsWebView> {
  int loadingPercentage = 0;
  bool loader = true;
  double _progress = 0;
  void initState() {
    // ApiUrl.contractorDashBoardUrl =
    // "https://ccsforasia.com/api/v1/webview/contractor/dashboard?token=";
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("Job Details"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .047,
            ),

            Container(
                height: MediaQuery.of(context).size.height * 4,
                child: WebViewWidget(
                    controller: WebViewController()
                      ..setJavaScriptMode(JavaScriptMode.unrestricted)
                      ..setBackgroundColor(Colors.white)
                      ..setNavigationDelegate(
                        NavigationDelegate(
                          onProgress: (int progress) {

                          },
                          onPageStarted: (String url) async {},
                          onPageFinished: (String url) {
                            print("url is +=++++++++++++ $url");


                          },
                          onWebResourceError: (WebResourceError error) {},
                          onNavigationRequest: (NavigationRequest request) {
                            if (request.url.contains('proposal') == true) {
                              Get.to(
                                BidNowWeb(
                                  url: request.url,
                                ),
                              );
                              return NavigationDecision.prevent;
                            } else {
                              return NavigationDecision.navigate;
                            }
                          },
                        ),
                      )
                    //Get.find<AuthService>().apiToken
                    // ..ini
                      ..loadRequest(
                          Uri.parse("https://ccsforasia.com/api/v1/webview/job/test-3?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL2Njc2ZvcmFzaWEuY29tL2FwaS92MS9sb2dpbiIsImlhdCI6MTY5ODgxOTQyMCwiZXhwIjoxNzAxNDExNDIwLCJuYmYiOjE2OTg4MTk0MjAsImp0aSI6IjFucHZjbTFDU3NLRTRFVXciLCJzdWIiOjE1LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.oK8N0Rt2bVQJBbypVTgbN9KNZLOG0kktD6JKJ8CvP-M"),
                          ))),
          ],
        ),
      ),
    );
  }

// Future<bool> _goBack(BuildContext context) async {
//   if (await controller.canGoBack()) {
//     controller.goBack();
//     return Future.value(false);
//   } else {
//     Get.offAllNamed(Routes.BASE);
//     return Future.value(true);
//   }
// }
}
