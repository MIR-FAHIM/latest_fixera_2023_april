
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/controller/post_project_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/post_lead/controller/post_lead_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';


class PostALeadFormScreen extends GetView<PostLeadController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Post A Lead"),
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
                      Text("Lead Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),

                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height:MediaQuery.of(context).size.height * 2,
                          child: Column(
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *.45,
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: controller.searchController.value,
                                      decoration: new InputDecoration(
                                        labelText: 'Name',
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
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *.45,
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: controller.searchController.value,
                                      decoration: new InputDecoration(
                                        labelText: 'Phone',
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
                              SizedBox(height: 20),
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
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
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Lead Title',
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
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width *.45,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),

                                    ),


                                    child: DropdownButton<String>(
                                      //underline: SizedBox(),
                                      isExpanded:true,
                                      value: "One",
                                      // icon: const Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.deepPurple
                                      ),
                                      underline: SizedBox(),
                                      onChanged: (String? newValue) {

                                      },
                                      items: <String>['One', 'Two', 'Free', 'Four']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(value),
                                          ),
                                        );
                                      })
                                          .toList(),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width *.45,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),

                                    ),


                                    child: DropdownButton<String>(
                                      //underline: SizedBox(),
                                      isExpanded:true,
                                      value: "One",
                                      // icon: const Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.deepPurple
                                      ),
                                      underline: SizedBox(),
                                      onChanged: (String? newValue) {

                                      },
                                      items: <String>['One', 'Two', 'Free', 'Four']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(value),
                                          ),
                                        );
                                      })
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width *.45,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),

                                    ),


                                    child: DropdownButton<String>(
                                      //underline: SizedBox(),
                                      isExpanded:true,
                                      value: "One",
                                      // icon: const Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.deepPurple
                                      ),
                                      underline: SizedBox(),
                                      onChanged: (String? newValue) {

                                      },
                                      items: <String>['One', 'Two', 'Free', 'Four']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(value),
                                          ),
                                        );
                                      })
                                          .toList(),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: MediaQuery.of(context).size.width *.45,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(12),

                                    ),


                                    child: DropdownButton<String>(
                                      //underline: SizedBox(),
                                      isExpanded:true,
                                      value: "One",
                                      // icon: const Icon(Icons.arrow_downward),
                                      iconSize: 24,
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.deepPurple
                                      ),
                                      underline: SizedBox(),
                                      onChanged: (String? newValue) {

                                      },
                                      items: <String>['One', 'Two', 'Free', 'Four']
                                          .map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(value),
                                          ),
                                        );
                                      })
                                          .toList(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *.45,
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: controller.searchController.value,
                                      decoration: new InputDecoration(
                                        labelText: 'Lead Start Time',
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
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *.45,
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: controller.searchController.value,
                                      decoration: new InputDecoration(
                                        labelText: 'Lead End Time',
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
                              Text("Lead Cost", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Lead Cost',
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
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *.45,
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: controller.searchController.value,
                                      decoration: new InputDecoration(
                                        labelText: 'e.g 100',
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
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *.45,
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: controller.searchController.value,
                                      decoration: new InputDecoration(
                                        labelText: 'e.g 50',
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
                              SizedBox(height: 20),
                              Text("Lead Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),

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


                                child: DropdownButton<String>(
                                  //underline: SizedBox(),
                                  isExpanded:true,
                                  value: "One",
                                  // icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                      color: Colors.deepPurple
                                  ),
                                  underline: SizedBox(),
                                  onChanged: (String? newValue) {

                                  },
                                  items: <String>['One', 'Two', 'Free', 'Four']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(value),
                                      ),
                                    );
                                  })
                                      .toList(),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text("Lead Languages", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
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


                                child: DropdownButton<String>(
                                  //underline: SizedBox(),
                                  isExpanded:true,
                                  value: "One",
                                  // icon: const Icon(Icons.arrow_downward),
                                  iconSize: 24,
                                  elevation: 16,
                                  style: const TextStyle(
                                      color: Colors.deepPurple
                                  ),
                                  underline: SizedBox(),
                                  onChanged: (String? newValue) {

                                  },
                                  items: <String>['One', 'Two', 'Free', 'Four']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(value),
                                      ),
                                    );
                                  })
                                      .toList(),
                                ),
                              ),
                              Text("Lead Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),


                              TextFormField(
                                maxLines: 5,
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Measurement Value',
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
                              Text("Your Location", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *.45,
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: controller.searchController.value,
                                      decoration: new InputDecoration(
                                        labelText: 'Select Locations',
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
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *.45,
                                    child: TextFormField(
                                      maxLines: 1,
                                      controller: controller.searchController.value,
                                      decoration: new InputDecoration(
                                        labelText: 'Enter Postal Code',
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
                              SizedBox(height: 20),
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
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
                                title: const Text('Featured', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                value: true,
                                onChanged: (bool? value) {

                                },
                              ),
                              SizedBox(height: 20),
                              SwitchListTile(
                                tileColor: Colors.yellow[50],
                                activeColor: Colors.green,
                                title: const Text('Status',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                value: true,
                                onChanged: (bool? value) {

                                },
                              ),
                              SizedBox(height: 20),
                              SwitchListTile(
                                tileColor: Colors.yellow[50],
                                activeColor: Colors.green,
                                title: const Text('Attachment',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                                value: true,
                                onChanged: (bool? value) {

                                },
                              ),





                            ],
                          ),
                        ),
                      ),



                      InkWell(
                        onTap: () {
                          // if(
                          //
                          // controller.company_name.value.text == "" ||
                          //     controller.company_address.value.text== "" ||
                          //     controller.company_mobile.value.text== "" ||
                          //     controller.company_email.value.text== "" ||
                          //     controller.vendor_name.value.text== "" ||
                          //     controller.vendor_address.value.text== "" ||
                          //     controller.vendor_mobile.value.text== "" ||
                          //     controller.payment_date.value.text== ""
                          //
                          //
                          // ){
                          //   Get.showSnackbar(Ui.errorSnackBar(
                          //       message:"Please check all the filed", title: 'Error'.tr));
                          // } else {
                          //   controller.createInvoiceController();
                          // }

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
