import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_fixera_2023/modules/Auth/controller/auth_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/change_pass/controller/change_pass_controller.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';




class ChangePassFormScreen extends GetView<ChangePassController> {
  const ChangePassFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ccsYelow,
        title: Text("Change Password"),
        centerTitle: true,


      ),
      body: Obx(
              () {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    child: Text("CCS Asia", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),),
                  ),
                  // for fixera
                  // Container(
                  //   alignment: Alignment.center,
                  //   // color: AppColors.backgroundColor,
                  //   child: Image.asset(
                  //     'images/fixera_logo.png',
                  //     height: 40,
                  //   ),
                  // ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            maxLines: 1,
                            controller: controller.currentPassController.value,
                            decoration: new InputDecoration(
                              labelText: 'Current Password',
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
                            controller: controller.newPassController.value,
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
                            controller: controller.confirmPassController.value,
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
                        ],
                      ),
                    ),
                  ),


                  InkWell(
                    onTap: () {

                      //controller.visible.value++;
                      controller.changePass();
                    },
                    child: AnimatedContainer(
                      duration: Duration(seconds: 2),
                      height: controller.visible.value == 1 ? 50 : 60,
                      width: controller.visible.value == 1 ? 50 : 140,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius:
                          BorderRadius.circular(controller.visible.value == 1 ? 60 : 10)),
                      alignment: Alignment.center,
                      child: controller.visible.value == 1
                          ? Center(child: CircularProgressIndicator())
                          : Text(
                        "Update Password",
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            );
          }
      ),
    );
  }
}

