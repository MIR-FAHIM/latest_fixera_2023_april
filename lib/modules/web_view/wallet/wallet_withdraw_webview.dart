import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class WalletWithdrawaWebView extends StatefulWidget {
  @override
  _walletWithdrawWebViewClassState createState() => _walletWithdrawWebViewClassState();
}

class _walletWithdrawWebViewClassState extends State<WalletWithdrawaWebView> {

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
    ..loadRequest(Uri.parse( Get.find<AuthService>().currentUser.value.userInfo!.roleName ==
        "contractor"
        ? ApiUrl.withdrawUrlContractor+Get.find<AuthService>().apiToken
        : ApiUrl.withdrawUrlConst+Get.find<AuthService>().apiToken
    ));
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