import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar navAppBar() {
  HomeViewController controller = HomeViewController();
  return AppBar(
    backgroundColor: AppColors.primaryColor,
    elevation: 1.5,
    centerTitle: true,
    // leading: Icon(
    //   Icons.menu,
    // ),
    title: GestureDetector(


      onTap: () {
        // print("Im a useless search");
      //  Get.toNamed(AppRoutes.SEARCH);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Container(
            height: 30,
            width: 250,
            //color: Colors.white,

            child: TextFormField(


              maxLines: 1,
              controller: controller.searchController,
              decoration:  InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.white,
                hoverColor: Colors.white,
                focusedBorder:OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.white, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                labelText: 'I am looking for',
                labelStyle: TextStyle(color: Colors.white),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                border: OutlineInputBorder(

                  borderSide:  BorderSide(color: Colors.white, width: 2.0),

                  borderRadius: BorderRadius.all(
                    Radius.circular(10.0),

                  ),
                ),
              ),
              validator: (value) {
                if (value!.trim().isEmpty)
                  return "Email is Required";
                else if (!GetUtils.isEmail(value.trim()))
                  return "Please enter valid email";
                else
                  return null;
              },
            ),
          ),
        ],
      ),
    ),
    actions: [
      SizedBox(
        width: 40.0,
      ),
    ],
  );
}
