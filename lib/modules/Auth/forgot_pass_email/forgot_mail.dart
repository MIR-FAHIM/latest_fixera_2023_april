import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_fixera_2023/modules/Auth/controller/auth_controller.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/sign_up_start_page.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/signup_page.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';




class ForGotMailView extends GetView<AuthController> {
  const ForGotMailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ccsYelow,
        title: Text("Forgot Mail"),
        centerTitle: true,



      ),
      body: Obx(
              () {
            return SingleChildScrollView(

              child: Container(
                height: MediaQuery.of(context).size.height -90,
                child: Column(
                  children: [
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.center,
                      child: Text("CCS Asia", style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.orange),),
                    ),

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
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Container(
                        child: Column(
                          children: <Widget>[
                            TextFormField(
                              maxLines: 1,
                              controller: controller.email.value,
                              decoration: new InputDecoration(
                                labelText: 'Give your email',
                                suffixIcon: Icon(
                                  Icons.lock_outline,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                ),
                              ),
                              obscureText: false,
                              validator: (value) {
                                if (value!.trim().isEmpty) {
                                  return "Email is Required";
                                }
                              },
                            ),

                            SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        controller.resetEmailFromLogin();
                        //controller.visible.value++;
                        // controller.loginController();
                      },
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: controller.resetEmailLoad.value == 1 ? 50 : 60,
                        width: controller.resetEmailLoad.value == 1 ? 50 : 140,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius:
                            BorderRadius.circular(controller.resetEmailLoad.value == 1 ? 60 : 10)),
                        alignment: Alignment.center,
                        child: controller.resetEmailLoad.value == 1
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                          "Send OTP",
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

