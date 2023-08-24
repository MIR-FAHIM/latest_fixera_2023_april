import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/controller/create_estimation_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/controller/post_project_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';

class CreateEstimationFormScreen extends GetView<CreateEstimationController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<CreateEstimationController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Estimation"),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Obx(() {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .9,
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 1,
                            controller: controller.receiver_email.value,
                            decoration: new InputDecoration(
                              labelText: 'Receiver Email Address',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                            controller: controller.project_title.value,
                            decoration: new InputDecoration(
                              labelText: 'Project Title',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                            controller: controller.company_name.value,
                            decoration: new InputDecoration(
                              labelText: 'Company Name',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                            controller: controller.company_address.value,
                            decoration: new InputDecoration(
                              labelText: 'Address',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                            keyboardType: TextInputType.number,
                            controller: controller.company_phone.value,
                            decoration: new InputDecoration(
                              labelText: 'Company Phone No',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                            controller:
                                controller.company_representive_name.value,
                            decoration: new InputDecoration(
                              labelText: 'Company Representative Name',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                            controller:
                            controller.company_representive_email.value,
                            decoration: new InputDecoration(
                              labelText: 'Company Representative Mail',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                            controller: controller.company_representive_adddress.value,
                            decoration: new InputDecoration(
                              labelText: 'Company Representative Address',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            controller:
                                controller.company_representive_phone.value,
                            decoration: new InputDecoration(
                              labelText: 'Company Representative Mobile Number',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                        ],
                      ),
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .78,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Project Line Items",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.material
                                      .add(TextFieldDataEstimation());
                                },
                                child: CircleAvatar(
                                    backgroundColor: AppColors.ccsYelow,
                                    radius: 12,
                                    child: Icon(
                                      Icons.add,
                                      color: AppColors.textColorWhite,
                                      size: 25,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(

                            height: MediaQuery.of(context).size.height * .3,
                            child: ListView.builder(
                                itemCount: controller.material.length,
                                itemBuilder: (c, index) {
                                  return Card(

                                    child: Container(
                                      decoration: BoxDecoration(
                                           color: AppColors.textColorGreen
                                          .withOpacity(.3),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Container(
                                                        width: size.width * .4,
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .text,
                                                          maxLines: 1,
                                                          onChanged: (value) =>
                                                              controller
                                                                  .cardTitleFunction(
                                                                      index,
                                                                      value),
                                                          decoration:
                                                              new InputDecoration(
                                                            labelText:
                                                                'Product Title',
                                                            // suffixIcon: Icon(
                                                            //   Icons.email_outlined,
                                                            // ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty)
                                                              return "Email is Required";
                                                            else if (!GetUtils
                                                                .isEmail(value
                                                                    .trim()))
                                                              return "Please enter valid email";
                                                            else
                                                              return null;
                                                          },
                                                        ),
                                                      ),
                                                      // Container(
                                                      //   width: size.width * .4,
                                                      //   child: TextFormField(
                                                      //     keyboardType:
                                                      //         TextInputType
                                                      //             .text,
                                                      //     maxLines: 1,
                                                      //     onChanged: (value) =>
                                                      //         controller
                                                      //             .cardTitleFunction(
                                                      //                 index,
                                                      //                 value),
                                                      //     decoration:
                                                      //         new InputDecoration(
                                                      //       labelText:
                                                      //           'Select Measurement',
                                                      //       // suffixIcon: Icon(
                                                      //       //   Icons.email_outlined,
                                                      //       // ),
                                                      //       border:
                                                      //           OutlineInputBorder(
                                                      //         borderRadius:
                                                      //             BorderRadius
                                                      //                 .all(
                                                      //           Radius.circular(
                                                      //               10.0),
                                                      //         ),
                                                      //       ),
                                                      //     ),
                                                      //     validator: (value) {
                                                      //       if (value!
                                                      //           .trim()
                                                      //           .isEmpty)
                                                      //         return "Email is Required";
                                                      //       else if (!GetUtils
                                                      //           .isEmail(value
                                                      //               .trim()))
                                                      //         return "Please enter valid email";
                                                      //       else
                                                      //         return null;
                                                      //     },
                                                      //   ),
                                                      // ),

                                                    ],
                                                  ),
                                                ),
                                                Divider(),
                                                Container(
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                    children: [
                                                      Container(
                                                        width: size.width * .4,
                                                        child: TextFormField(
                                                          maxLines: 1,
                                                          onChanged: (value) =>
                                                              controller
                                                                  .desFunction(
                                                                  index,
                                                                  value),
                                                          decoration:
                                                          new InputDecoration(
                                                            labelText:
                                                            'Description',
                                                            // suffixIcon: Icon(
                                                            //   Icons.email_outlined,
                                                            // ),
                                                            border:
                                                            OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(
                                                                Radius.circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty)
                                                              return "Email is Required";
                                                            else if (!GetUtils
                                                                .isEmail(value
                                                                .trim()))
                                                              return "Please enter valid email";
                                                            else
                                                              return null;
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        width: size.width * .4,
                                                        child: TextFormField(
                                                          keyboardType:
                                                          TextInputType
                                                              .number,
                                                          maxLines: 1,
                                                          onChanged: (value) =>
                                                              controller
                                                                  .productQuantityFunction(
                                                                  index,
                                                                  int.parse(
                                                                      value)),
                                                          decoration:
                                                          new InputDecoration(
                                                            labelText:
                                                            'Quantity',
                                                            // suffixIcon: Icon(
                                                            //   Icons.email_outlined,
                                                            // ),
                                                            border:
                                                            OutlineInputBorder(
                                                              borderRadius:
                                                              BorderRadius
                                                                  .all(
                                                                Radius.circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty)
                                                              return "Email is Required";
                                                            else if (!GetUtils
                                                                .isEmail(value
                                                                .trim()))
                                                              return "Please enter valid email";
                                                            else
                                                              return null;
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(),
                                                Container(
                                                  height: 50,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [

                                                      // Container(
                                                      //   height: 50,
                                                      //   width: MediaQuery.of(context)
                                                      //           .size
                                                      //           .width *
                                                      //       .2,
                                                      //   decoration: BoxDecoration(
                                                      //     border: Border.all(
                                                      //       color: Colors.black,
                                                      //       width: 1,
                                                      //     ),
                                                      //     borderRadius:
                                                      //         BorderRadius.circular(
                                                      //             12),
                                                      //   ),
                                                      //   child: DropdownButton<String>(
                                                      //     //underline: SizedBox(),
                                                      //     isExpanded: true,
                                                      //     value: "One",
                                                      //     // icon: const Icon(Icons.arrow_downward),
                                                      //     iconSize: 24,
                                                      //     elevation: 16,
                                                      //     style: const TextStyle(
                                                      //         color:
                                                      //             Colors.deepPurple),
                                                      //     underline: SizedBox(),
                                                      //     onChanged:
                                                      //         (String? newValue) {},
                                                      //     items: <String>[
                                                      //       'One',
                                                      //       'DA',
                                                      //       'BF',
                                                      //       'BG',
                                                      //       'Bundle',
                                                      //       'BX',
                                                      //       'CF',
                                                      //       'CR',
                                                      //       'CY',
                                                      //       'EA',
                                                      //       'FT',
                                                      //       'HR',
                                                      //       'LB',
                                                      //       'HF',
                                                      //       'LY',
                                                      //       "MB",
                                                      //       'ML'
                                                      //     ].map<
                                                      //             DropdownMenuItem<
                                                      //                 String>>(
                                                      //         (String value) {
                                                      //       return DropdownMenuItem<
                                                      //           String>(
                                                      //         value: value,
                                                      //         child: Padding(
                                                      //           padding:
                                                      //               const EdgeInsets
                                                      //                   .all(8.0),
                                                      //           child: Text(value),
                                                      //         ),
                                                      //       );
                                                      //     }).toList(),
                                                      //   ),
                                                      // ),
                                                      Container(
                                                        width: size.width * .4,
                                                        child: TextFormField(
                                                          keyboardType:
                                                              TextInputType
                                                                  .number,
                                                          maxLines: 1,
                                                          onChanged: (value) =>
                                                              controller
                                                                  .productQuantityFunction(
                                                                      index,
                                                                      int.parse(
                                                                          value)),
                                                          decoration:
                                                              new InputDecoration(
                                                            labelText: 'Unit',
                                                            // suffixIcon: Icon(
                                                            //   Icons.email_outlined,
                                                            // ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty)
                                                              return "Email is Required";
                                                            else if (!GetUtils
                                                                .isEmail(value
                                                                    .trim()))
                                                              return "Please enter valid email";
                                                            else
                                                              return null;
                                                          },
                                                        ),
                                                      ),
                                                      Container(
                                                        width: size.width * .4,
                                                        child: TextFormField(
                                                          keyboardType:
                                                          TextInputType
                                                              .number,
                                                          maxLines: 1,
                                                          onChanged: (value) =>
                                                              controller
                                                                  .priceFunction(
                                                                      index,
                                                                      int.parse(
                                                                          value)),
                                                          decoration:
                                                              new InputDecoration(
                                                            labelText: 'Price',
                                                            // suffixIcon: Icon(
                                                            //   Icons.email_outlined,
                                                            // ),
                                                            border:
                                                                OutlineInputBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .all(
                                                                Radius.circular(
                                                                    10.0),
                                                              ),
                                                            ),
                                                          ),
                                                          validator: (value) {
                                                            if (value!
                                                                .trim()
                                                                .isEmpty)
                                                              return "Email is Required";
                                                            else if (!GetUtils
                                                                .isEmail(value
                                                                    .trim()))
                                                              return "Please enter valid email";
                                                            else
                                                              return null;
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20),
                                            GestureDetector(
                                              onTap: () {
                                                // for (int i = 0; i < controller.material.length; i++) {
                                                //   print('Container $i:');
                                                //   print('Text 1: ${ controller.material[i].workOrderqty}');
                                                //   print('Text 2: ${ controller.material[i].workOrderunit}');
                                                //   print('Text 3: ${ controller.material[i].workOrderdesc}');
                                                // }
                                                controller.material
                                                    .removeAt(index);
                                              },
                                              child: CircleAvatar(
                                                  backgroundColor:
                                                      AppColors.textColorRed,
                                                  radius: 12,
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: AppColors
                                                        .textColorWhite,
                                                    size: 25,
                                                  )),
                                            ),
                                            SizedBox(height: 20),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            readOnly: true,
                            maxLines: 1,
                            keyboardType:
                            TextInputType
                                .number,
                            controller:
                                controller.estimation_final_amount.value,
                            decoration: new InputDecoration(
                              fillColor: AppColors.ccsYelow,

                              labelText: 'Estimation Final Amount',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                            keyboardType:
                            TextInputType
                                .text,
                            controller:
                            controller.estimation_description.value,
                            decoration: new InputDecoration(
                              fillColor: AppColors.ccsYelow,

                              labelText: 'Estimation Description',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                            controller: controller.estimation_policy.value,
                            decoration: new InputDecoration(
                              labelText: 'Estimation and Terms and Conditions',
                              // suffixIcon: Icon(
                              //   Icons.email_outlined,
                              // ),
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
                          Container(
                            padding: EdgeInsets.only(top: 10, bottom: 14, left: 20, right: 10),
                            margin: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(color: const Color(0xFF652981).withOpacity(0.2), blurRadius: 2, offset: const Offset(0, 2)),
                              ],
                              //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Authorized Signature Date".tr,
                                  style: Get.textTheme.bodyText1,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  // color: AppColors.primaryColor,
                                  width: Get.size.width,
                                  child: TextFormField(
                                    onTap: () {

                                      controller.selectStartDate(context);







                                    },
                                    controller: controller.startDateInput,
                                    keyboardType: TextInputType.phone,
                                    onChanged: (input) {
                                      controller.startDateInput.text = input;
                                    },
                                    validator: (input) {
                                      if (input!.isEmpty) {
                                        return 'This field cannot be empty'.tr;
                                      } else {
                                        return null;
                                      }
                                    },
                                    style: Get.textTheme.bodyText2,
                                    textAlign: TextAlign.start,
                                    cursorColor: const Color(0xFF652981),

                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * .5,
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
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () async {
                      if (controller.receiver_email.value.text == "" ||
                          controller.project_title.value.text == "" ||
                          controller.company_name.value.text == "" ||
                          controller.company_address.value.text == "" ||
                          controller.company_phone.value.text == "" ||
                          controller.company_representive_name.value.text ==
                              "" ||
                          controller.company_representive_phone.value.text ==
                              "") {
                        Get.showSnackbar(Ui.errorSnackBar(
                            message: "Please check all the field",
                            title: 'Error'.tr));
                      } else {
                        if (controller.estimationproductqtyList.value.isEmpty ||

                            controller.estimationproductdescList.value.isEmpty) {
                          Get.showSnackbar(Ui.errorSnackBar(
                              message:
                                  "Please add atleast one item in product line",
                              title: 'Error'.tr));
                        } else {
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
                          controller.createEstimationController(
                              controller.base64Image.value);
                        }
                      }
                    },
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: controller.visible.value == 1 ? 50 : 60,
                        width: controller.visible.value == 1 ? 50 : 140,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(
                                controller.visible.value == 1 ? 60 : 10)),
                        alignment: Alignment.center,
                        child: controller.visible.value == 1
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                                "Create Estimation",
                                style: TextStyle(
                                  color: AppColors.backgroundColor,
                                  fontSize: 14,
                                ),
                              ),
                      ),
                    ),
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
