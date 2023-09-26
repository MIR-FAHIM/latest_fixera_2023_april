import 'dart:convert';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:latest_fixera_2023/models/auth_model/sign_up_data_model.dart';
import 'package:latest_fixera_2023/modules/Auth/controller/auth_controller.dart';
import 'package:latest_fixera_2023/modules/Auth/sign_up/verification_page.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

import '../../../utils/ui_support.dart';

class ProfessionalInfoView extends GetView<AuthController> {
  const ProfessionalInfoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.ccsYelow,
        title: Text("Sign Up"),
        centerTitle: true,
      ),
      body: Obx(() {
        return SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 1.8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          radius: 10,
                          backgroundColor: controller.pageState.value == 0
                              ? AppColors.textColorGreen
                              : Colors.grey),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: controller.pageState.value == 1
                            ? AppColors.textColorGreen
                            : Colors.grey,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: controller.pageState.value == 2
                            ? AppColors.textColorGreen
                            : Colors.grey,
                      ),
                    ],
                  ),
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
                        color: AppColors.ccsYelow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Container(
                    alignment: Alignment.center,
                    // color: AppColors.backgroundColor,
                    child: Text(
                      "Professional Info",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Location",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 55,
                      color: Colors.white,
                      child: DropdownSearch<String>(
                        mode: Mode.MENU,
                        dropdownSearchDecoration: InputDecoration(
                          contentPadding: EdgeInsets.all(5),
                          focusColor: Color(0xFF652981),
                          border: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        showSelectedItems: true,
                        items: controller.locationListFinal.value
                            .map((item) => item.title.toString())
                            .toList(),
                        onChanged: (input) {
                          // controller.locatinID.value = input;
                        },
                        selectedItem: "Canada",
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
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
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
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
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Start As",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: _size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: _size.width * .45,
                            child: RadioListTile(
                              title: Text(
                                "Construction Company",
                                style: TextStyle(fontSize: 12),
                              ),
                              value: 1,
                              groupValue: controller.grpValue.value,
                              onChanged: (value) {
                                controller.selectRole.value = "Lead MarketPlaces";
                                controller.grpValue.value =
                                    int.parse(value.toString());
                              },
                            ),
                          ),
                          SizedBox(
                            width: _size.width * .45,
                            child: RadioListTile(
                              title: Text(
                                "Contractor",
                                style: TextStyle(fontSize: 12),
                              ),
                              value: 2,
                              groupValue: controller.grpValue.value,
                              onChanged: (value) {
                                controller.selectRole.value = "contractor";
                                controller.grpValue.value =
                                    int.parse(value.toString());

                                print("+++++++${controller.grpValue.value}");
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  controller.grpValue.value == 1
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("No. Of Employees You Have"),
                                Obx(() {
                                  return Container(
                                    height: MediaQuery.of(context).size.height *.3,
                                    child: ListView.builder(
                                        itemCount:
                                            controller.employeeListFinal.length,
                                        itemBuilder: (contex, index) {
                                          var data = controller
                                              .employeeListFinal[index];
                                          return InkWell(
                                            onTap: () {
                                              controller.selectEmployee.value =
                                                  data.title;
                                            //  controller.empIndex.value = index;
                                              print(
                                                  "my select employee is ${controller.selectEmployee.value}");
                                            },
                                            child: Obx(
                                             () {
                                                return Card(
                                                    color: controller.selectEmployee
                                                                .value ==
                                                            data.title
                                                        ? AppColors.primaryColor
                                                        : Colors.white,
                                                    child: ListTile(
                                                      title: Text(controller
                                                          .employeeListFinal
                                                          .value[index]
                                                          .title
                                                          .toString()),
                                                    ));
                                              }
                                            ),
                                          );
                                        }),
                                  );
                                }),
                              ],
                            ),
                          ),
                        )
                      : Container(),
                  controller.grpValue.value == 2
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Category",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: 55,
                                color: Colors.white,
                                child: DropdownSearch<String>(
                                  mode: Mode.MENU,
                                  dropdownSearchDecoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(5),
                                    focusColor: Color(0xFF652981),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 1.0),
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  showSelectedItems: true,
                                  items: controller.categoryListFinal.value
                                      .map((item) => item.title.toString())
                                      .toList(),
                                  onChanged: (input) {},
                                  selectedItem: "Air Duct Cleaning",
                                ),
                              ),
                            ],
                          ),
                        )
                      : Container(),
                  Container(
                    height: _size.height * .5,
                    width: 400,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: EdgeInsets.all(10),
                            child: Container(
                                child: SfSignaturePad(
                                    key: controller.signatureGlobalKey,
                                    backgroundColor: Colors.white,
                                    strokeColor: Colors.black,
                                    minimumStrokeWidth: 1.0,
                                    maximumStrokeWidth: 4.0),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey)))),
                        SizedBox(height: 10),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              TextButton(
                                child: Text('Clear'),
                                onPressed: () {
                                  controller.signatureGlobalKey.currentState!
                                      .clear();
                                },
                              )
                            ])
                      ],
                    ),
                  ),
                  CheckboxListTile(
                      title: Text(
                          "Agree to CCS Asia Agreements Terms and Condition"),
                      value: controller.agreeOrNor.value,
                      onChanged: (bool? newValue) {
                        controller.agreeOrNor.value = newValue!;
                      }),
                  SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () async {
                      if (controller.agreeOrNor.value == true) {
                        final data = await controller
                            .signatureGlobalKey.currentState!
                            .toImage(pixelRatio: 3.0);
                        controller.bytes = await data.toByteData(
                            format: ui.ImageByteFormat.png);

                        // final bytes = File(userSugnatureFile.path).readAsBytesSync();
                        controller.base64Image.value =
                            "data:image/png;base64," +
                                base64Encode(
                                    controller.bytes!.buffer.asUint8List());
                        print(
                            "my signature image is ${controller.bytes!.buffer.asUint8List()}");
                        print(
                            "my signature image is ${controller.base64Image.value}");
                        controller
                            .registerController(controller.base64Image.value);
                      } else {
                        Get.showSnackbar(Ui.errorSnackBar(
                            message: "Please agree to our term and conditions",
                            title: 'Error'.tr));
                      }
                    },
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: controller.visible.value == 1 ? 50 : 60,
                        width: controller.visible.value == 1 ? 50 : 140,
                        decoration: BoxDecoration(
                            color: AppColors.ccsYelow,
                            borderRadius: BorderRadius.circular(
                                controller.visible.value == 1 ? 60 : 10)),
                        alignment: Alignment.center,
                        child: controller.visible.value == 1
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
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
