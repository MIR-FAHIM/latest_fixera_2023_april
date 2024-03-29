import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_fixera_2023/modules/Auth/forgot_pass_email/change_pass.dart';
import 'package:latest_fixera_2023/modules/Auth/controller/auth_controller.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/sign_up_start_page.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/signup_page.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';




class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
controller.advancedStatusCheck(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ccsYelow,
        title: Text("Sign In Now"),
        centerTitle: true,



      ),
      bottomNavigationBar:  Container(
          height: 50,
          width: Get.width,
          color: AppColors.ccsYelow,
          child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Do not have an account?", style: TextStyle(color: Colors.white),),
                  InkWell(
                      onTap: (){
                        controller.getSignUPDataListControlelr();
                        controller.pageState.value = 0;
                        Get.to(SignUpStratView());
                      },
                      child: Text("Create Account", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),)),
                ],
              ))),
      body: Obx(
         () {
          return SingleChildScrollView(

            child: Container(
              height: MediaQuery.of(context).size.height *.85,
              child: Column(
                children: [
                  SizedBox(height: 15,),
                  Container(
                    alignment: Alignment.center,
                    // color: AppColors.backgroundColor,
                    child: Image.asset(
                      'images/ccsasiabanner.png',
                      height: 70,
                    ),
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
                  SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            maxLines: 1,
                            controller: controller.email.value,
                            decoration: new InputDecoration(
                              labelText: 'Email',
                              suffixIcon: Icon(
                                Icons.email_outlined,
                              ),
                              border: OutlineInputBorder(
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
                          SizedBox(height: 20),
                          TextFormField(
                            maxLines: 1,
                            controller: controller.passController.value,
                            decoration: new InputDecoration(
                              labelText: 'Password',
                              suffixIcon: Icon(
                                Icons.lock_outline,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                ),
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Password is Required";
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
                      //controller.visible.value++;
                      controller.loginController();
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: controller.signInVisible.value == 1 ? 50 : 60,
                      width: controller.signInVisible.value == 1 ? 50 : 140,
                      decoration: BoxDecoration(
                          color: AppColors.ccsYelow,
                          borderRadius:
                          BorderRadius.circular(controller.signInVisible.value == 1 ? 60 : 10)),
                      alignment: Alignment.center,
                      child: controller.signInVisible.value == 1
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                        "Sign In",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                    Get.toNamed(Routes.FORGOTMAIL);
                    },

                      child: Text("Forgot Password?")),



                ],
              ),
            ),
          );
        }
      ),
    );
  }
}

