import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/repositories/auth_repositories/auth_repositories.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';

import '../../../../services/auth_services.dart';


class ChangePassController extends GetxController {
  //TODO: Implement SplashscreenController

  var currentPassController = TextEditingController().obs;
  var newPassController = TextEditingController().obs;
  var confirmPassController = TextEditingController().obs;
final visible = 0.obs;

  final checkLabour = false.obs;
  final checkMaterial = false.obs;



  @override
  Future<void> onInit() async {


    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  changePass() async{
    //visible.value++;
    AuthRepository().changePass(currentPassController.value.text, newPassController.value.text, confirmPassController.value.text).then((e) async{

      print("my login data");
      if(e != null){
        Get.find<AuthService>().removeCurrentUser();
        Get.showSnackbar(Ui.successSnackBar(
            message:e["results"], title: 'Success'.tr));
        visible.value = 0;

        Get.offAllNamed(Routes.SPLASHSCREEN);
      } else {
        print("error ++++++++++++++");
        visible.value = 0;

      }

    });
  }

}
