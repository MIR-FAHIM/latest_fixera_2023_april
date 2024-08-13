import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/routes/app_pages.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
initAllServices() async {
  Get.log('starting all services ...');

  await GetStorage.init();
 // await Get.putAsync<SettingsService>(() async => SettingsService());
  await Get.putAsync<AuthService>(() async => AuthService());
  await Get.find<AuthService>().handleDeepLink();
  Get.log('All services started...');
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAllServices();
  runApp(
      GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Fixera",
    initialRoute: AppPages.INITIAL,
    getPages: AppPages.routes,
  )
  );
}


