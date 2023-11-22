import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_fixera_2023/modules/Auth/controller/auth_controller.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/sign_up_start_page.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/signup_page.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';

class ResetPassView extends GetView<AuthController> {
  const ResetPassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ccsYelow,
        title: Text("Change Password"),
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height - 90,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "CCS Asia",
                    style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
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
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          maxLines: 1,
                          controller: controller.passController.value,
                          decoration: new InputDecoration(
                            labelText: 'New Password',
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
                        SizedBox(height: 20),
                        TextFormField(
                          maxLines: 1,
                          controller: controller.conPassController.value,
                          decoration: new InputDecoration(
                            labelText: 'Confirm Password',
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
                    if(controller.passController.value.text == controller.conPassController.value.text){
                      controller.resetPassFromLogin();
                    }else{
                      Get.showSnackbar(Ui.errorSnackBar(
                          message:"Confirm pass did not match", title: 'Error'.tr));
                    }

                  },
                  child: AnimatedContainer(
                    duration: Duration(seconds: 2),
                    height: controller.resetPassLoad.value == 1 ? 50 : 60,
                    width: controller.resetPassLoad.value == 1 ? 50 : 140,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(
                            controller.resetPassLoad.value == 1 ? 60 : 10)),
                    alignment: Alignment.center,
                    child: controller.resetPassLoad.value == 1
                        ? Center(child: CircularProgressIndicator())
                        : Text(
                            "Change Pass",
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
      }),
    );
  }
}
