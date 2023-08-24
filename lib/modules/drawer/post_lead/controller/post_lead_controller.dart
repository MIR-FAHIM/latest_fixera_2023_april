import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class PostLeadController extends GetxController {
  //TODO: Implement SplashscreenController
  var searchController = TextEditingController().obs;
  final checkLabour = false.obs;
  final checkMaterial = false.obs;
final visible = 0.obs;


  @override
  Future<void> onInit() async {


    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }


}
