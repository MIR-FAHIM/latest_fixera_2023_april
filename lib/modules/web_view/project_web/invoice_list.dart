import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/proposal_estimation_web.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/proposal_wedash.dart';
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


class InvoiceWebList extends StatefulWidget {
  String? url;
  String? appBar;
  InvoiceWebList(this.url, this.appBar);
  @override
  _projectManageWebViewClassState createState() => _projectManageWebViewClassState();
}

class _projectManageWebViewClassState extends State<InvoiceWebList> {
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
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: Text("Invoice"),),

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
                onWebResourceError: (WebResourceError error) {},
                onNavigationRequest: (NavigationRequest request) {

                  if (request.url.contains('details') == true) {
                    Get.to(
                      ProposalEstimationWebView(
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
            ..loadRequest(Uri.parse("${widget.url!}?token=${Get.find<AuthService>().apiToken}")))
      ),
      // _progress < 1 ? Container(
      //   child: LinearProgressIndicator(
      //     value: _progress,
      //   ),
      // ):SizedBox()

    );
  }



}