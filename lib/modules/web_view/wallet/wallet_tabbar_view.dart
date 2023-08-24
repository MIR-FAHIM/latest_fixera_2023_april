import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_completed_web.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_manage_web.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_ongoing_web_view.dart';
import 'package:latest_fixera_2023/modules/web_view/wallet/wallet_income_history.dart';
import 'package:latest_fixera_2023/modules/web_view/wallet/wallet_transfer_history.dart';
import 'package:latest_fixera_2023/modules/web_view/wallet/wallet_withdraw_webview.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';

/// Flutter code sample for [TabBar].




class WalletTabBar extends StatefulWidget {


  @override
  State<WalletTabBar> createState() => _ProjectTabBarState();
}

class _ProjectTabBarState extends State<WalletTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
          title: const Text('Wallet'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Withdraw",
              ),
              Tab(
                text: "Transfer History",
              ),
              Tab(
                text: "Income History",
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            Center(
              child: WalletWithdrawaWebView(),
            ),
            Center(
              child: WalletTransferWebView(),
            ),
            Center(
              child: WalletIncomeWebView(),
            ),
          ],
        ),
      ),
    );
  }
}
