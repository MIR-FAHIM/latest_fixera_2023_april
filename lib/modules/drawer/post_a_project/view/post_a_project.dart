
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/controller/post_project_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';


class PostAProjectFormScreen extends GetView<PostProjectController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<PostProjectController>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Post A Project"),
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
                      Text("Project Type", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                      Container(
                        height: MediaQuery.of(context).size.height * .15,
                        width: MediaQuery.of(context).size.width *9,
                        color: Colors.white,
                        child: Row(
                          children: [

                        Checkbox(
                        value: controller.checkLabour.value,
                          onChanged: ( newValue) {
                            controller.checkLabour.value = newValue!;
                          },
                        ),
                            Text("Labour"),
                          Checkbox(
                            value: controller.checkMaterial.value,
                            onChanged: ( newValue) {
                              controller.checkMaterial.value = newValue!;
                            },
                          ),
                            Text("Material"),
                          ],
                        ),


                      ),
                      Text("Project Categories", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
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
                      Text("Project Description", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height:MediaQuery.of(context).size.height * .78,
                          child: Column(
                            children: [

                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
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
                              TextFormField(
                                maxLines: 1,
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
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Select Your Start Date',
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
                                  labelText: 'Select Your End Date',
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





                            ],
                          ),
                        ),
                      ),
                      Text("Project Details (Optionals)", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),

                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Container(
                          height:MediaQuery.of(context).size.height * 2.2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [




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
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'How Many Square',
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
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Project Contact Name',
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
                                  labelText: 'Project Contact Phone Number',
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
                                  labelText: 'Project Contact Email',
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
                                  labelText: 'Project Expiration Date',
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
                              Text("Project Cost",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Email',
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
                              Text("Language", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Email',
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
                              Text("Project Details",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Email',
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

                              Text("Project Details", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Email',
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
                              Text("Project Details",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),),
                              TextFormField(
                                maxLines: 1,
                                controller: controller.searchController.value,
                                decoration: new InputDecoration(
                                  labelText: 'Email',
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
                                  labelText: 'Email',
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
                                  labelText: 'Email',
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
