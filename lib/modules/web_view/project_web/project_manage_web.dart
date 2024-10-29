import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/proposal_wedash.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/invoice_list.dart';
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

      backgroundColor: Colors.white,

      body:
      Container(
          height: MediaQuery.of(context).size.height * .953,
          child: WebViewWidget(controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..setBackgroundColor(Colors.white)
            ..setNavigationDelegate(
              NavigationDelegate(
                onProgress: (int progress) {
                  // Update loading bar.
                },
                onPageStarted: (String url) async {
                  print("my url is $url");



                },
                onPageFinished: (String url) {


                },

                onNavigationRequest: (NavigationRequest request) {
                  if (request.url.contains('proposals') == true) {
                    Get.to(
                      ProposalWebView(
                        url: request.url,

                      ),
                    );
                    return NavigationDecision.prevent;
                  }
                  if (request.url.contains('invoice') ==
                      true) {
                    Get.to(
                      InvoiceWebList(
                      request.url,
                        "Invoice"
                      ),
                    );
                    return NavigationDecision.prevent;
                  } else {
                    return NavigationDecision.navigate;
                  }

                },
              ),
            )
            ..loadRequest(Uri.parse(Get.find<AuthService>().currentUser.value.userInfo!.roleName == "contractor"
                ?ApiUrl.contractorManageJobsUrl+Get.find<AuthService>().apiToken
                : ApiUrl.leadManageJobsUrl+Get.find<AuthService>().apiToken)))
      ),
          // _progress < 1 ? Container(
          //   child: LinearProgressIndicator(
          //     value: _progress,
          //   ),
          // ):SizedBox()

    );
  }



}