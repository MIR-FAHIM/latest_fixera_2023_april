import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';

class ProposalWebView extends StatefulWidget {
  @override
  _proposalWebViewClassState createState() => _proposalWebViewClassState();
}

class _proposalWebViewClassState extends State<ProposalWebView> {
  bool loader = true;

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
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
        title: Text("Proposals"),

      ),
      backgroundColor: Colors.white,

      body:SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * .047,),
            loader == true ? Center(child: CircularProgressIndicator(),) :
            Container(
                height: MediaQuery.of(context).size.height * 1.5,
                child: WebViewWidget(controller: WebViewController()
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

                        setState(() {
                          loader = false;
                        });

                      },
                      onWebResourceError: (WebResourceError error) {},
                      onNavigationRequest: (NavigationRequest request) {

                        return NavigationDecision.navigate;
                      },
                    ),
                  )
                  ..loadRequest(Uri.parse(ApiUrl.contractorProposalsUrl+Get.find<AuthService>().apiToken)))
            ),
          ],
        ),
      ),
    );
  }




}