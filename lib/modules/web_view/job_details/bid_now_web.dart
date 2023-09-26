import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/api_provider/api_url.dart';
import 'package:latest_fixera_2023/modules/web_view/job_details/proposal_job_details_after_submit_bid.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:get/get.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BidNowWeb extends StatefulWidget {
  String? url;
  BidNowWeb({this.url});
  @override
  _dashboardWebViewClassState createState() => _dashboardWebViewClassState();
}

class _dashboardWebViewClassState extends State<BidNowWeb> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;

  PullToRefreshController? pullToRefreshController;

  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;

  @override
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
      onWillPop: () async {
        var isLastPage = await inAppWebViewController.canGoBack();
        if (isLastPage) {
          inAppWebViewController.goBack();
          return false;
        } else {
          Get.offAllNamed(Routes.BASE);
        }
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.primaryColor,
            title: Text("Job Details"),
            centerTitle: true,
            leading: InkWell(
                onTap: () {
                  Get.back();
                },
                child: Icon(Icons.arrow_back)),
          ),
          body: Stack(
            children: [
              InAppWebView(
                initialOptions: InAppWebViewGroupOptions(
                    crossPlatform: InAppWebViewOptions(
                  transparentBackground: true,
                )),
                //
                initialUrlRequest: URLRequest(
                    url: Uri.parse(
                        "${widget.url}?token=${Get.find<AuthService>().apiToken}")),
                onLoadStart: (InAppWebViewController controller, url) {
                  print("onLoadStart++++++++++++++++++++++++++ " +
                      url.toString());
                  if (url.toString().contains("webview/proposals")) {
                    // Redirect to a different URL
                    print("i am here");
                    print("I am here and my url is ${url}");
                    Get.to(ProposalWebViewAfterBid(
                      url: url.toString(),
                    ));
                    // inAppWebViewController?.loadUrl(
                    //   urlRequest: URLRequest(url: Uri.parse("${url.toString()}")),
                    // );
                  } else if (url.toString().contains("work-order-details")) {
                    Get.to(ProposalWebViewAfterBid(
                      url: url.toString(),
                    ));
                  }
                },
                onUpdateVisitedHistory: (controller, url, androidIsReload) {
                  print("my url in bid now is _________________________$url");
                  // if (url!.host.contains("webview/proposals")) {
                  //   print("hlw sukkur submit ______________!!!");
                  //   webViewController?.goBack();
                  //   Get.to(ProposalWebViewAfterBid(
                  //     url: url.toString(),
                  //   ));
                  // }
                },
                onWebViewCreated: (InAppWebViewController controller) {
                  print("working on bid now");

                  inAppWebViewController = controller;

                  print(inAppWebViewController.getUrl());
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              _progress < 1
                  ? Container(
                      child: LinearProgressIndicator(
                        value: _progress,
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
