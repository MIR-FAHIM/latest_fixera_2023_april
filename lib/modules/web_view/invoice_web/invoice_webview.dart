import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:isolate';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';


import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/modules/web_view/invoice_web/invoice_show.dart';
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

import '../project_web/proposal_wedash.dart';










class InvoiceWebView extends StatefulWidget {
  @override
  _manageAccountWebViewClassState createState() =>
      _manageAccountWebViewClassState();
}

class _manageAccountWebViewClassState extends State<InvoiceWebView> {
  bool loader = true ;
  var controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..setBackgroundColor(Colors.white)
    ..setNavigationDelegate(
      NavigationDelegate(
        onProgress: (int progress) {
          // Update loading bar.
        },
        onPageStarted: (String url) async {},
        onPageFinished: (String url) {},
        onWebResourceError: (WebResourceError error) {},
        onNavigationRequest: (NavigationRequest request) {
          return NavigationDecision.navigate;
        },
      ),
    )
    ..loadRequest(
        Uri.parse( Get.find<AuthService>().currentUser.value.userInfo!.roleName ==
            "contractor"? ApiUrl.contractorInvoiceUrl+Get.find<AuthService>().apiToken : ApiUrl.vendorInvoiceUrl+Get.find<AuthService>().apiToken));
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
        appBar: AppBar(
          backgroundColor: AppColors.primaryColor,
          title: Text("Invoice"),
          centerTitle: true,
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

                      controller: WebViewController(

                      )

                        ..setJavaScriptMode(JavaScriptMode.unrestricted)
                        ..setBackgroundColor(Colors.white)
                        ..setNavigationDelegate(
                          NavigationDelegate(
                            onProgress: (int progress) {},
                            onPageStarted: (String url) async {



                            },

                            onPageFinished: (String url) {




                            },
                            onWebResourceError: (WebResourceError error) {

                            },
                            onNavigationRequest: (NavigationRequest request) {

                              if(request.url.contains('show') == true){

                                Get.to(InvoiceShow(url: request.url,),);
                                return NavigationDecision.prevent;

                              }  if(request.url.contains('message-center') == true){

                                Get.to(InvoiceShow(url: request.url,),);
                                return NavigationDecision.prevent;

                              }   else{
                                return NavigationDecision.navigate;
                              }

                            },


                          ),
                        )
                      //Get.find<AuthService>().apiToken
                      // ..ini


                        ..loadRequest(Uri.parse(

                            Get.find<AuthService>().currentUser.value.userInfo!.roleName ==
                                "contractor" ?     ApiUrl.contractorInvoiceUrl+Get.find<AuthService>().apiToken : ApiUrl.vendorInvoiceUrl+Get.find<AuthService>().apiToken
                        ),
                            headers: {"Authorization": "Bearer ${Get.find<AuthService>().apiToken}"})
                  )),

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
