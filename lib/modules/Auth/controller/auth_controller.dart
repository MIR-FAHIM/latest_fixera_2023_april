import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/models/auth_model/login_model.dart';
import 'package:latest_fixera_2023/repositories/auth_repositories/auth_repositories.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';

class AuthController extends GetxController {
  //TODO: Implement LoginController

  var emailController = TextEditingController().obs;
  var passController = TextEditingController().obs;
  final visible = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  loginController() async{
    visible.value++;
    AuthRepository().userLogin(emailController.value.text, passController.value.text).then((e) async{

      print("my login data");
      if(e != null){
        var data = LoginModel.fromJson(e);
        await Get.find<AuthService>().setUser(data);
        visible.value = 0;
        print("hlw bro ++++++++++ ${Get.find<AuthService>().isAuth.toString()}");
        Get.offAllNamed(Routes.BASE);
      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }
}
