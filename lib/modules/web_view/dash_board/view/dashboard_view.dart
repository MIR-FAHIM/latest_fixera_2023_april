import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/modules/web_view/dash_board/view/proposal_wedash.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class DashboardWebView extends StatefulWidget {
  @override
  _dashboardWebViewClassState createState() => _dashboardWebViewClassState();
}

class _dashboardWebViewClassState extends State<DashboardWebView> {
  int loadingPercentage = 0;
  bool loader = true;

  void initState() {
    ApiUrl.contractorDashBoardUrl =
        "https://ccsforasia.com/api/v1/webview/contractor/dashboard?token=";
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
        title: Text("Dashboard"),
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
                              onProgress: (int progress) {},
                              onPageStarted: (String url) async {},
                              onPageFinished: (String url) {
                                print("url is +=++++++++++++ $url");


                              },
                              onWebResourceError: (WebResourceError error) {},
                              onNavigationRequest: (NavigationRequest request) {
                                if (request.url.contains('proposals') == true) {
                                  Get.to(
                                    ProposalWebView(
                                      url: request.url,
                                    ),
                                  );
                                  return NavigationDecision.prevent;
                                }
                                if (request.url.contains('message-center') ==
                                    true) {
                                  Get.to(
                                    ProposalWebView(
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
                              Uri.parse(Get.find<AuthService>()
                                          .currentUser
                                          .value
                                          .userInfo!
                                          .roleName ==
                                      "contractor"
                                  ? ApiUrl.contractorDashBoardUrl +
                                      Get.find<AuthService>().apiToken
                                  : ApiUrl.vendorDashBoardUrl +
                                      Get.find<AuthService>().apiToken),
                              headers: {
                                "Authorization":
                                    "Bearer ${Get.find<AuthService>().apiToken}"
                              }))),
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
