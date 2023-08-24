import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/controller/create_estimation_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/create_work_order/dart/controller/work_order_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/controller/post_project_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';

class CreateWorkOrderFormScreen extends GetView<CreateWorkOrderController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Work Order"),
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
                      height: MediaQuery.of(context).size.height * 1.6,
                      child: Column(
                        children: [
                          TextFormField(
                            maxLines: 1,
                            controller: controller.rcvEmail.value,
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
                              labelText: 'Company Address',
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
                            controller: controller.jobName.value,
                            decoration: new InputDecoration(
                              labelText: 'Job Name',
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
                            controller: controller.work_order_crew.value,
                            decoration: new InputDecoration(
                              labelText: 'Crew',
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
                                      controller.selectCheckInDate(context);
                                    },
                                    controller: controller.dateInput.value,
                                    keyboardType: TextInputType.phone,
                                    onChanged: (input) {
                                      controller.dateInput.value.text = input;
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
                                  "Select End Date".tr,
                                  style: Get.textTheme.bodyText1,
                                  textAlign: TextAlign.start,
                                ),
                                SizedBox(
                                  // color: AppColors.primaryColor,
                                  width: Get.size.width,
                                  child: TextFormField(
                                    readOnly: true,
                                    onTap: () {
                                      controller.selectCheckOutDate(context);
                                    },
                                    controller: controller.endDateInput.value,
                                    keyboardType: TextInputType.phone,
                                    onChanged: (input) {
                                      controller.endDateInput.value.text = input;
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
                          SizedBox(height: 20),
                          TextFormField(
                            maxLines: 1,
                            controller: controller.customer_name.value,
                            decoration: new InputDecoration(
                              labelText: 'Customer Name',
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
                            controller: controller.customer_address.value,
                            decoration: new InputDecoration(
                              labelText: 'Customer Address',
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
                            controller: controller.company_rep_name.value,
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
                            controller: controller.company_email.value,
                            decoration: new InputDecoration(
                              labelText: 'Company Representative Email',
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
                            controller: controller.company_mobile.value,
                            decoration: new InputDecoration(
                              labelText: 'Company Representative Phone',
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
                                controller.work_order_total_amount.value,
                            decoration: new InputDecoration(
                              labelText: 'Proposal Amount',
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
                            maxLines: 3,
                            controller: controller.work_order_desc.value,
                            decoration: new InputDecoration(
                              labelText: 'Description',
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
                            width: size.width,
                            child: TextFormField(
                              maxLines: 1,
                              controller:
                                  controller.projectTitleController.value,
                              decoration: new InputDecoration(
                                fillColor: AppColors.ccsYelow,

                                labelText: 'Disclaimer',
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
                    ),
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * .4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Material",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                              GestureDetector(
                                onTap: () {
                                  controller.material.add(TextFieldData());
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
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: size.width * .2,
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        maxLines: 1,
                                                        onChanged: (value) =>
                                                            controller
                                                                .workOrderqty(
                                                                    index,
                                                                    int.parse(
                                                                        value)),
                                                        decoration:
                                                            new InputDecoration(
                                                          labelText: 'Quantity',
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
                                                              .isEmail(
                                                                  value.trim()))
                                                            return "Please enter valid email";
                                                          else
                                                            return null;
                                                        },
                                                      ),
                                                    ),
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
                                                      width: size.width * .2,
                                                      child: TextFormField(
                                                        keyboardType:
                                                            TextInputType.text,
                                                        maxLines: 1,
                                                        onChanged: (value) =>
                                                            controller
                                                                .workOrderunit(
                                                                    index,
                                                                    value),
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
                                                              .isEmail(
                                                                  value.trim()))
                                                            return "Please enter valid email";
                                                          else
                                                            return null;
                                                        },
                                                      ),
                                                    ),
                                                    Container(
                                                      width: size.width * .4,
                                                      child: TextFormField(
                                                        maxLines: 1,
                                                        onChanged: (value) =>
                                                            controller
                                                                .workOrderdesc(
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
                                                              .isEmail(
                                                                  value.trim()))
                                                            return "Please enter valid email";
                                                          else
                                                            return null;
                                                        },
                                                      ),
                                                    ),
                                                  ],
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  InkWell(
                    onTap: () {
                      if (
                          controller.company_name.value.text == "" ||
                          controller.company_address.value.text == "" ||
                          controller.work_order_desc.value.text == "" ||
                          controller.work_order_crew.value.text == "" ||

                          controller.customer_name.value.text == "" ||
                          controller.customer_address.value.text == "") {
                        Get.showSnackbar(Ui.errorSnackBar(
                            message: "Please check all the fields",
                            title: 'Error'.tr));
                      } else {
                        controller.createWorkOrderController();
                      }
                    },
                    child: Center(
                      child: AnimatedContainer(
                        duration: Duration(seconds: 2),
                        height: controller.visible.value == 1 ? 50 : 60,
                        width: controller.visible.value == 1 ? 100 : 180,
                        decoration: BoxDecoration(
                            color: AppColors.ccsYelow,
                            borderRadius: BorderRadius.circular(
                                controller.visible.value == 1 ? 60 : 10)),
                        alignment: Alignment.center,
                        child: controller.visible.value == 1
                            ? Center(child: CircularProgressIndicator())
                            : Text(
                                "Create Work Order",
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
