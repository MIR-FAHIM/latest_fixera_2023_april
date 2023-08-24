import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_fixera_2023/modules/Auth/Signin/sign_page.dart';
import 'package:latest_fixera_2023/modules/Auth/controller/auth_controller.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/professional_info.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';




class SuccessPageView extends GetView<AuthController> {
  const SuccessPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ccsYelow,
        title: Text("Sign Up"),
        centerTitle: true,


      ),
      body: Obx(
              () {
            return SingleChildScrollView(

              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.center,
                      child: Text("CCS Asia", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),),
                    ),


                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                      alignment: Alignment.center,
                      // color: AppColors.backgroundColor,
                      child: Text(
                        "Join For a Good Start",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      // color: AppColors.backgroundColor,
                      child: Text(
                        "Join for a good reason & benefit Yourself!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textColorGrey,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),

                    Text("CONGRATULATION", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, ),),

                    //***** for fixera
                    // Container(
                    //   alignment: Alignment.center,
                    //   // color: AppColors.backgroundColor,
                    //   child: Image.asset(
                    //     'images/fixera_logo.png',
                    //     height: 40,
                    //   ),
                    // ),
                    // ****** fixera end
                    SizedBox(height: 20,),

                    InkWell(
                      onTap: () {
                        Get.to(LoginView());

                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: controller.visibleSuccess.value == 1 ? 50 : 60,
                        width: controller.visibleSuccess.value == 1 ? 50 : 140,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                            BorderRadius.circular(controller.visibleSuccess.value == 1 ? 60 : 10)),
                        alignment: Alignment.center,
                        child: controller.visibleSuccess.value == 1
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                          "Continue",
                          style: TextStyle(
                            color: AppColors.backgroundColor,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),



                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}

