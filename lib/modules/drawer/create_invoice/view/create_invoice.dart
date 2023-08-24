
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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

import '../controller/create_invoice_controller.dart';


class CreateInvoiceFormScreen extends GetView<InvoiceController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Create Invoice"),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Obx(
              () {
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
                          height:MediaQuery.of(context).size.height * .9,
                          child: Column(
                            children: [
                              TextFormField(
                                maxLines: 1,
                                controller: controller.rcvEmail.value,
                                decoration: new InputDecoration(
                                  labelText: 'Recievable Email',
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
                                controller: controller.company_email.value,
                                decoration: new InputDecoration(
                                  labelText: 'Company Email',
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
                                  labelText: 'Company Mobile',
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
                                controller: controller.vendor_name.value,
                                decoration: new InputDecoration(
                                  labelText: 'Vendor Name',
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
                                controller: controller.vendor_mobile.value,
                                decoration: new InputDecoration(
                                  labelText: 'Vendor Mobile',
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
                                controller: controller.vendor_address.value,
                                decoration: new InputDecoration(
                                  labelText: 'Vendor Address',
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
                                      "Select Date".tr,
                                      style: Get.textTheme.bodyText1,
                                      textAlign: TextAlign.start,
                                    ),
                                    SizedBox(
                                      // color: AppColors.primaryColor,
                                      width: Get.size.width,
                                      child: TextFormField(
                                        onTap: () {

                                          controller.selectCheckInDate(context);







                                        },
                                        controller: controller.dateInput,
                                        keyboardType: TextInputType.phone,
                                        onChanged: (input) {
                                          controller.dateInput.text = input;
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

                      Divider(),

                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height:MediaQuery.of(context).size.height * .6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [




                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Pricing", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                  GestureDetector(
                                    onTap: () {
                                      controller.material.add(TextFieldDataInvoice());
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
                              SizedBox(height: 20),
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
                                                            .spaceBetween,
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
                                                                      .productTitleList(
                                                                      index,

                                                                          value),
                                                              decoration:
                                                              new InputDecoration(
                                                                labelText: 'Product Title',
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
                                                            width: size.width * .2,
                                                            child: TextFormField(
                                                              keyboardType:
                                                              TextInputType.number,
                                                              maxLines: 1,
                                                              onChanged: (value) =>
                                                                  controller
                                                                      .rateList(
                                                                      index,
                                                                      int.parse(value)),
                                                              decoration:
                                                              new InputDecoration(
                                                                labelText: 'Rate',
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
                                                            width: size.width * .2,
                                                            child: TextFormField(
                                                              keyboardType: TextInputType.number,
                                                              maxLines: 1,
                                                              onChanged: (value) =>
                                                                  controller
                                                                      .quantityList(
                                                                      index,
                                                                      int.parse(value)),
                                                              decoration:
                                                              new InputDecoration(
                                                                labelText:
                                                                'Qantity',
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
                                                    ),
                                                    Divider(),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Container(
                                                          width: size.width * .5,
                                                          child: TextFormField(
                                                           // controller: controller.final_amount.value,
                                                            keyboardType:
                                                            TextInputType
                                                                .number,
                                                            maxLines: 1,
                                                            onChanged: (value) =>
                                                                controller
                                                                    .priceList(
                                                                    index,
                                                                    int.parse(
                                                                        value),
                                                                ),
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
                                                                  .isEmail(
                                                                  value.trim()))
                                                                return "Please enter valid email";
                                                              else
                                                                return null;
                                                            },
                                                          ),
                                                        ),
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
                                                      ],
                                                    ),
                                                  ],
                                                ),


                                                SizedBox(height: 20),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                              ),

                              SizedBox(height: 20,),


                              TextFormField(
                                maxLines: 1,
                                readOnly: true,
                                keyboardType: TextInputType.number,
                                controller: controller.total_amount.value,
                                decoration: new InputDecoration(
                                  labelText: 'Total Amount',
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      controller.getImage(ImageSource.gallery);
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(seconds: 2),
                                      height: 40,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          color: AppColors.ccsYelow,
                                          borderRadius: BorderRadius.circular(10)),
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
                                  controller.imageData.isEmpty ? Container(): ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
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
                              ),

                              SizedBox(
                                height: 10,
                              ),




                            ],
                          ),
                        ),
                      ),

                      InkWell(
                        onTap: () {
                          if(

                          controller.company_name.value.text == "" ||
                          controller.company_address.value.text== "" ||
                          controller.company_mobile.value.text== "" ||
                          controller.company_email.value.text== "" ||
                          controller.vendor_name.value.text== "" ||
                          controller.vendor_address.value.text== "" ||
                          controller.vendor_mobile.value.text== "" ||
                          controller.dateInput.value.text== ""


                          ){
                            Get.showSnackbar(Ui.errorSnackBar(
                                message:"Please check all the filed", title: 'Error'.tr));
                          } else {
                            controller.createInvoiceController();
                          }

                        },
                        child: Center(
                          child: AnimatedContainer(
                            duration: Duration(seconds: 2),
                            height:
                            controller.visible.value == 1 ? 50 : 60,
                            width:
                            controller.visible.value == 1 ? 50 : 140,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(
                                    controller.visible.value == 1
                                        ? 60
                                        : 10)),
                            alignment: Alignment.center,
                            child: controller.visible.value == 1
                                ? Center(
                                child: CircularProgressIndicator())
                                : Text(
                              "Create Invoice",
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
          }
      ),


    );
  }
}
