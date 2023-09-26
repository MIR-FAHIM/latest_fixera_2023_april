import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/create_invoice.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/invoice_list.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/work_order_web.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class ProjectWebView extends StatefulWidget {
  @override
  _projectWebViewClassState createState() => _projectWebViewClassState();
}

class _projectWebViewClassState extends State<ProjectWebView> {

  var controller = WebViewController()
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

          if (request.url.contains('create-invoice') == true) {
            Get.to(
              CreateInvoiceWeb(
                url: request.url,


              ),
            );
            return NavigationDecision.prevent;
          }
          //job/tranfer_payment/summary/56/11/15
          if (request.url.contains('project/invoice/list/') == true) {
            Get.to(
              InvoiceWebList(
                request.url,
                "Invoice"

              ),
            );
            return NavigationDecision.prevent;
          }
          if (request.url.contains('work-order-details') == true) {
            Get.to(
              WorkOrderDetailsWeb(
                url: request.url,

              ),
            );
            return NavigationDecision.prevent;
          } else {
            return NavigationDecision.navigate;
          }
          // if (request.url.contains('payment-process') ==
          //     true) {
          //   Get.to(
          //     BidNowWeb(
          //       url: request.url,
          //     ),
          //   );
          //   return NavigationDecision.prevent;
          // } else {

        // }
        },
      ),
    )
    ..loadRequest(Uri.parse(Get.find<AuthService>().currentUser.value.userInfo!.roleName == "contractor"
        ?ApiUrl.projectsOngoingUrl+Get.find<AuthService>().apiToken : ApiUrl.leadOngoingUrl+Get.find<AuthService>().apiToken));
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