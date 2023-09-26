import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/controller/create_estimation_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/controller/post_project_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';

class PostAProjectFormScreen extends GetView<CreateEstimationController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Post A Project"),
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
                  // Text("Project Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                  // Container(
                  //   height: MediaQuery.of(context).size.height * .15,
                  //   width: MediaQuery.of(context).size.width *9,
                  //   color: Colors.white,
                  //   child: Row(
                  //     children: [
                  //
                  //   Checkbox(
                  //   value: controller.checkLabour.value,
                  //     onChanged: ( newValue) {
                  //       controller.checkLabour.value = newValue!;
                  //     },
                  //   ),
                  //       Text("Labour"),
                  //     Checkbox(
                  //       value: controller.checkMaterial.value,
                  //       onChanged: ( newValue) {
                  //         controller.checkMaterial.value = newValue!;
                  //       },
                  //     ),
                  //       Text("Material"),
                  //     ],
                  //   ),
                  //
                  //
                  // ),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Container(
                  //       width: MediaQuery.of(context).size.width * .4,
                  //       child: TextFormField(
                  //         readOnly: true,
                  //         maxLines: 1,
                  //         controller: controller.projectContactName.value,
                  //         decoration: new InputDecoration(
                  //           labelText: 'Name',
                  //           // suffixIcon: Icon(
                  //           //   Icons.email_outlined,
                  //           // ),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(10.0),
                  //             ),
                  //           ),
                  //         ),
                  //         validator: (value) {
                  //           if (value!.trim().isEmpty)
                  //             return "Email is Required";
                  //           else if (!GetUtils.isEmail(value.trim()))
                  //             return "Please enter valid email";
                  //           else
                  //             return null;
                  //         },
                  //       ),
                  //     ),
                  //     Container(
                  //       width: MediaQuery.of(context).size.width * .4,
                  //       child: TextFormField(
                  //         readOnly: true,
                  //         maxLines: 1,
                  //         controller: controller.projectPhoneNo.value,
                  //         decoration: new InputDecoration(
                  //           labelText: 'Phone',
                  //           // suffixIcon: Icon(
                  //           //   Icons.email_outlined,
                  //           // ),
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.all(
                  //               Radius.circular(10.0),
                  //             ),
                  //           ),
                  //         ),
                  //         validator: (value) {
                  //           if (value!.trim().isEmpty)
                  //             return "Email is Required";
                  //           else if (!GetUtils.isEmail(value.trim()))
                  //             return "Please enter valid email";
                  //           else
                  //             return null;
                  //         },
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  SizedBox(height: 20),
                  Text(
                    "Project Description",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .8,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            maxLines: 1,
                            controller: controller.projectTitlePostAJob.value,
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
                          Text(
                            "Select Custom Price",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),

                          //custom price
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton(
                              //underline: SizedBox(),
                              isExpanded: true,

                              value: controller.customPriceProjectSelect.value,
                              // icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: SizedBox(),
                              onChanged: (newValue) {
                                controller.customPriceProjectSelect.value =
                                    newValue;
                              },
                              items: controller.customPriceProject
                                  .map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value.key,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(value.value.toString()),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            controller: controller.customPrice.value,
                            decoration: new InputDecoration(
                              labelText: 'Custom Price Value',
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
                          //project duration
                          Text(
                            "Select Project Duration",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton(
                              //underline: SizedBox(),
                              isExpanded: true,
                              value:
                                  controller.projectDurationProjectSelect.value,
                              // icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: SizedBox(),
                              onChanged: (newValue) {
                                controller.projectDurationProjectSelect.value =
                                    newValue;
                              },
                              items: controller.projectDurationProject
                                  .map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value.key,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(value.value.toString()),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 20),
                          //construction level
                          Text(
                            "Select Construction Level",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton(
                              //underline: SizedBox(),
                              isExpanded: true,
                              value: controller.catSelect.value,
                              // icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: SizedBox(),
                              onChanged: (newValue) {
                                controller.catSelect.value = newValue;
                              },
                              items: controller.catDataProject
                                  .map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value.key,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(value.value.toString()),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          // SizedBox(height: 20),
                          // //select measurement
                          // Text(
                          //   "Select Measurement",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, fontSize: 14),
                          // ),
                          //
                          // Container(
                          //   height: 50,
                          //   width: MediaQuery.of(context).size.width,
                          //   decoration: BoxDecoration(
                          //     border: Border.all(
                          //       color: Colors.black,
                          //       width: 1,
                          //     ),
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          //   child: DropdownButton(
                          //     //underline: SizedBox(),
                          //     isExpanded: true,
                          //     value: controller.measurementProjectSelect.value,
                          //     // icon: const Icon(Icons.arrow_downward),
                          //     iconSize: 24,
                          //     elevation: 16,
                          //     style: const TextStyle(color: Colors.deepPurple),
                          //     underline: SizedBox(),
                          //     onChanged: (newValue) {
                          //       controller.measurementProjectSelect.value =
                          //           newValue;
                          //     },
                          //     items: controller.measurementProject
                          //         .map<DropdownMenuItem>((value) {
                          //       return DropdownMenuItem(
                          //         value: value.key,
                          //         child: Padding(
                          //           padding: EdgeInsets.all(8.0),
                          //           child: Text(value.value.toString()),
                          //         ),
                          //       );
                          //     }).toList(),
                          //   ),
                          // ),
                          // SizedBox(height: 20),
                          // TextFormField(
                          //   maxLines: 1,
                          //   controller: controller.measurementValue.value,
                          //   decoration: new InputDecoration(
                          //     labelText: 'Measurement Value',
                          //     // suffixIcon: Icon(
                          //     //   Icons.email_outlined,
                          //     // ),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(10.0),
                          //       ),
                          //     ),
                          //   ),
                          //   validator: (value) {
                          //     if (value!.trim().isEmpty)
                          //       return "Email is Required";
                          //     else if (!GetUtils.isEmail(value.trim()))
                          //       return "Please enter valid email";
                          //     else
                          //       return null;
                          //   },
                          // ),
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 14, left: 20, right: 10),
                            margin: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xFF652981)
                                        .withOpacity(0.2),
                                    blurRadius: 2,
                                    offset: const Offset(0, 2)),
                              ],
                              //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Select Start Date".tr,
                                  style: Get.textTheme.bodyText1,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  // color: AppColors.primaryColor,
                                  width: Get.size.width,
                                  child: TextFormField(
                                    readOnly: true,
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
                          SizedBox(height: 10),
                          Container(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 14, left: 20, right: 10),
                            margin: const EdgeInsets.only(
                                left: 15, right: 15, top: 10, bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: const Color(0xFF652981)
                                        .withOpacity(0.2),
                                    blurRadius: 2,
                                    offset: const Offset(0, 2)),
                              ],
                              //   border: Border.all(color: Get.theme.focusColor.withOpacity(0.05))
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Select End Date".tr,
                                  style: Get.textTheme.bodyText1,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  // color: AppColors.primaryColor,
                                  width: Get.size.width,
                                  child: TextFormField(
                                    onTap: () {
                                      controller.selectEndDate(context);
                                    },
                                    controller: controller.endDateInput,
                                    keyboardType: TextInputType.phone,
                                    onChanged: (input) {
                                      controller.endDateInput.text = input;
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
                  // Text(
                  //   "Additional Details (Optionals)",
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  // ),

                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 1.25,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Project Cost",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            controller: controller.projectCost.value,
                            decoration: new InputDecoration(
                              labelText: 'Project Cost',
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
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Bidding",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * .4,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  controller: controller.bidingStart.value,
                                  decoration: new InputDecoration(
                                    labelText: 'Bidding Price (Public)',
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
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * .4,
                                child: TextFormField(
                                  keyboardType: TextInputType.number,
                                  maxLines: 1,
                                  controller: controller.bidingEnd.value,
                                  decoration: new InputDecoration(
                                    labelText: 'Bidding Price (Private)',
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
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Project Categories",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton(
                              //underline: SizedBox(),
                              isExpanded: true,
                              value: controller.catSelect.value,
                              // icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: SizedBox(),
                              onChanged: (newValue) {
                                controller.catSelect.value = newValue;
                              },
                              items: controller.catDataProject
                                  .map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value.key,
                                  child: Obx(() {
                                    return CheckboxListTile(
                                        value: controller.projectCat
                                            .contains(value.key),
                                        onChanged: (isChecked) => controller
                                            .itemChange(value.key, isChecked!),
                                        title: Text(value.value.toString()));
                                  }),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Language",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton(
                              //underline: SizedBox(),
                              isExpanded: true,
                              value: controller.languageSelect.value,
                              // icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: SizedBox(),
                              onChanged: (newValue) {
                                controller.languageSelect.value = newValue;
                              },
                              items: controller.languageList
                                  .map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value.key,
                                  child: Obx(() {
                                    return CheckboxListTile(
                                        value: controller.selectedLangList
                                            .contains(value.key),
                                        onChanged: (isChecked) => controller
                                            .langChange(value.key, isChecked!),
                                        title: Text(value.value.toString()));
                                  }),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Project Details",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            maxLines: 3,
                            controller: controller.searchController.value,
                            decoration: new InputDecoration(
                              labelText: 'Write Your Project Details',
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
                          // SizedBox(height: 20),
                          //
                          // Text(
                          //   "Skill Required",
                          //   style: TextStyle(
                          //       fontWeight: FontWeight.bold, fontSize: 14),
                          // ),
                          // TextFormField(
                          //   maxLines: 1,
                          //   controller: controller.searchController.value,
                          //   decoration: new InputDecoration(
                          //     labelText: 'Email',
                          //     // suffixIcon: Icon(
                          //     //   Icons.email_outlined,
                          //     // ),
                          //     border: OutlineInputBorder(
                          //       borderRadius: BorderRadius.all(
                          //         Radius.circular(10.0),
                          //       ),
                          //     ),
                          //   ),
                          //   validator: (value) {
                          //     if (value!.trim().isEmpty)
                          //       return "Email is Required";
                          //     else if (!GetUtils.isEmail(value.trim()))
                          //       return "Please enter valid email";
                          //     else
                          //       return null;
                          //   },
                          // ),
                          SizedBox(height: 20),
                          Text(
                            "Your Location",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 14),
                          ),
                          Container(
                            height: 50,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: DropdownButton(
                              //underline: SizedBox(),
                              isExpanded: true,
                              value: controller.locationSelect.value,
                              // icon: const Icon(Icons.arrow_downward),
                              iconSize: 24,
                              elevation: 16,
                              style: const TextStyle(color: Colors.deepPurple),
                              underline: SizedBox(),
                              onChanged: (newValue) {
                                controller.locationSelect.value = newValue;
                                controller.locationId.value = newValue;
                                print("my locationid is ${controller.locationId.value}");

                              },
                              items: controller.locationList
                                  .map<DropdownMenuItem>((value) {
                                return DropdownMenuItem(
                                  value: value.key,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(value.value.toString()),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            maxLines: 1,
                            controller: controller.postalCode.value,
                            decoration: new InputDecoration(
                              labelText: 'Postal Code',
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
                            controller: controller.yourAddress.value,
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
                          SwitchListTile(
                            tileColor: Colors.yellow[50],
                            activeColor: Colors.green,
                            title: const Text(
                              'Featured',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            value: controller.isFeatured.value,
                            onChanged: (bool? value) {
                              if (controller.isFeatured.value == false) {
                                controller.isFeatured.value = true;
                              } else {
                                controller.isFeatured.value = false;
                              }
                            },
                          ),
                          // SizedBox(height: 20),
                          // SwitchListTile(
                          //   tileColor: Colors.yellow[50],
                          //   activeColor: Colors.green,
                          //   title: const Text('Status',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                          //   value: controller.isStatus.value,
                          //   onChanged: (bool? value) {
                          //     if(controller.isStatus.value == false){
                          //       controller.isStatus.value = true;
                          //     }else {
                          //       controller.isStatus.value = false;
                          //     }
                          //   },
                          // ),
                          SizedBox(height: 20),
                          SwitchListTile(
                            tileColor: Colors.yellow[50],
                            activeColor: Colors.green,
                            title: const Text(
                              'Attachment',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            value: controller.isAttachment.value,
                            onChanged: (bool? value) {
                              if (controller.isAttachment.value == false) {
                                controller.isAttachment.value = true;
                              } else {
                                controller.isAttachment.value = false;
                              }
                            },
                          ),
                          SizedBox(height: 10),
                          controller.isAttachment.value == true
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller
                                            .getImage(ImageSource.gallery);
                                      },
                                      child: AnimatedContainer(
                                        duration: Duration(seconds: 2),
                                        height: 40,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: AppColors.ccsYelow,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Attachment",
                                          style: TextStyle(
                                            color: AppColors.backgroundColor,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                    controller.imageData.isEmpty
                                        ? Container()
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            child: Image.memory(
                                              base64Decode(
                                                controller.imageData.value!,
                                              ),
                                              height: Get.size.height * .1,
                                              width: Get.size.width * .2,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                  ],
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),

                  InkWell(
                    onTap: () {
                      if (controller.customPriceProjectSelect.value == "" ||
                          controller.projectCost.value.text == "" ||
                          controller.customPrice.value.text == "" ||
                          controller.startDateInput.value.text == "" ||
                          controller.endDateInput.value.text == "") {
                        Get.showSnackbar(Ui.errorSnackBar(
                            message: "Please check all the filed",
                            title: 'Error'.tr));
                      } else {
                        controller.createJobProjectLeadMultipart();
                      }
                    },
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: controller.visible.value == 1 ? 40 : 40,
                        width: controller.visible.value == 1 ? 100 : 200,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(
                                controller.visible.value == 1 ? 60 : 10)),
                        alignment: Alignment.center,
                        child: controller.visible.value == 1
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                                "Create Project",
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
