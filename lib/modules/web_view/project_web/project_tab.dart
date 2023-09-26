import 'package:flutter/material.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_completed_web.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_manage_web.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_ongoing_web_view.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';

/// Flutter code sample for [TabBar].




class ProjectTabBar extends StatefulWidget {

  int? page;
  ProjectTabBar(@required this.page);



  @override
  State<ProjectTabBar> createState() => _ProjectTabBarState();
}

class _ProjectTabBarState extends State<ProjectTabBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 2000,
      child: DefaultTabController(
        initialIndex: widget.page!,
        length: 3,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: AppColors.primaryColor,
            title: const Text('Projects'),
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
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              ProjectManageWebView(),
              Center(
                child: ProjectWebView(),
              ),
              Center(
                child: ProjectCompletedWebView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
