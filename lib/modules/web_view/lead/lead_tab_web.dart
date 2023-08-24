import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_completed_web.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_manage_web.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_ongoing_web_view.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';

/// Flutter code sample for [TabBar].




class LeadTabBar extends StatefulWidget {


  @override
  State<LeadTabBar> createState() => _ProjectTabBarState();
}

class _ProjectTabBarState extends State<LeadTabBar> {
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
          title: const Text('Leads'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Manage",
              ),
              Tab(
                text: "Ongoing",
              ),
              Tab(
                text: "Completed",
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[
            Center(
              child: ProjectManageWebView(),
            ),
            Center(
              child: ProjectWebView(),
            ),
            Center(
              child: ProjectCompletedWebView(),
            ),
          ],
        ),
      ),
    );
  }
}
