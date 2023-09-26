import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class ProposalEstimationWebView extends StatefulWidget {
  String? url;
  String? appBar;

  ProposalEstimationWebView(this.url,this.appBar);
  @override
  _dashboardWebViewClassState createState() => _dashboardWebViewClassState();
}

class _dashboardWebViewClassState extends State<ProposalEstimationWebView> {
  int loadingPercentage = 0;

  void initState() {
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
        title: Text("Proposals"),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .047,
            ),
            Container(
                height: MediaQuery.of(context).size.height * 2.5,
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

                              return NavigationDecision.navigate;

                          },
                        ),
                      )
                    //Get.find<AuthService>().apiToken
                    // ..ini
                      ..loadRequest(
                        Uri.parse(
                            "${widget.url}?token=${Get.find<AuthService>().apiToken}"),
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
