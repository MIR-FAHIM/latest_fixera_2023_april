// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:latest_fixera_2023/modules/Auth/controller/auth_controller.dart';
// import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
//
//
//
//
// class SignUpView extends GetView<AuthController> {
//   const SignUpView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: AppColors.primaryColor,
//         title: Text("Sign Up"),
//         centerTitle: true,
//
//
//       ),
//       body: Obx(
//               () {
//             return SingleChildScrollView(
//
//               child: Container(
//                 height: MediaQuery.of(context).size.height,
//                 child: Column(
//                   children: [
//                     SizedBox(height: 20,),
//                     Container(
//                       alignment: Alignment.center,
//                       child: Text("CCS Asia", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.orange),),
//                     ),
//
//
//                     SizedBox(
//                       height: 10.0,
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       // color: AppColors.backgroundColor,
//                       child: Text(
//                         "Join For a Good Start",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     Container(
//                       alignment: Alignment.center,
//                       // color: AppColors.backgroundColor,
//                       child: Text(
//                         "Join for a good reason & benefit Yourself!",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: AppColors.textColorGrey,
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 35.0,
//                     ),
//
//                     //***** for fixera
//                     // Container(
//                     //   alignment: Alignment.center,
//                     //   // color: AppColors.backgroundColor,
//                     //   child: Image.asset(
//                     //     'images/fixera_logo.png',
//                     //     height: 40,
//                     //   ),
//                     // ),
//                     // ****** fixera end
//                     SizedBox(height: 20,),
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Container(
//                         child: Column(
//                           children: <Widget>[
//                             TextFormField(
//                               maxLines: 1,
//                               controller: controller.JobData.value,
//                               decoration: new InputDecoration(
//                                 labelText: 'First Name',
//                                 suffixIcon: Icon(
//                                   Icons.email_outlined,
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(10.0),
//                                   ),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value!.trim().isEmpty)
//                                   return "Email is Required";
//                                 else if (!GetUtils.isEmail(value.trim()))
//                                   return "Please enter valid email";
//                                 else
//                                   return null;
//                               },
//                             ),
//                             SizedBox(height: 10),
//                             TextFormField(
//                               maxLines: 1,
//                               controller: controller.JobData.value,
//                               decoration: new InputDecoration(
//                                 labelText: 'Last Name',
//                                 suffixIcon: Icon(
//                                   Icons.email_outlined,
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(10.0),
//                                   ),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value!.trim().isEmpty)
//                                   return "Email is Required";
//                                 else if (!GetUtils.isEmail(value.trim()))
//                                   return "Please enter valid email";
//                                 else
//                                   return null;
//                               },
//                             ),
//                             SizedBox(height: 10),
//                             TextFormField(
//                               maxLines: 1,
//                               controller: controller.JobData.value,
//                               decoration: new InputDecoration(
//                                 labelText: 'Email',
//                                 suffixIcon: Icon(
//                                   Icons.email_outlined,
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(10.0),
//                                   ),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value!.trim().isEmpty)
//                                   return "Email is Required";
//                                 else if (!GetUtils.isEmail(value.trim()))
//                                   return "Please enter valid email";
//                                 else
//                                   return null;
//                               },
//                             ),
//                             SizedBox(height: 10),
//                             TextFormField(
//                               maxLines: 1,
//                               controller: controller.JobData.value,
//                               decoration: new InputDecoration(
//                                 labelText: 'Phone Number',
//                                 suffixIcon: Icon(
//                                   Icons.email_outlined,
//                                 ),
//                                 border: OutlineInputBorder(
//                                   borderRadius: BorderRadius.all(
//                                     Radius.circular(10.0),
//                                   ),
//                                 ),
//                               ),
//                               validator: (value) {
//                                 if (value!.trim().isEmpty)
//                                   return "Email is Required";
//                                 else if (!GetUtils.isEmail(value.trim()))
//                                   return "Please enter valid email";
//                                 else
//                                   return null;
//                               },
//                             ),
//                             SizedBox(height: 10),
//
//                             SizedBox(
//                               height: 25,
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         //controller.visible.value++;
//                         controller.loginController();
//                       },
//                       child: AnimatedContainer(
//                         duration: Duration(seconds: 2),
//                         height: controller.visible.value == 1 ? 50 : 60,
//                         width: controller.visible.value == 1 ? 50 : 140,
//                         decoration: BoxDecoration(
//                             color: Colors.green,
//                             borderRadius:
//                             BorderRadius.circular(controller.visible.value == 1 ? 60 : 10)),
//                         alignment: Alignment.center,
//                         child: controller.visible.value == 1
//                             ? Center(child: CircularProgressIndicator())
//                             : Text(
//                           "Continue",
//                           style: TextStyle(
//                             color: AppColors.backgroundColor,
//                             fontSize: 12,
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 25,
//                     ),
//
//                     Spacer(),
//                     Container(
//                         height: 30,
//                         width: Get.width,
//                         color: AppColors.primaryColor,
//                         child: Center(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("Already have an account?", style: TextStyle(color: Colors.white),),
//                                 InkWell(
//                                   onTap: (){
//
//                                   },
//                                     child: Text("Login Account", style: TextStyle(color: Colors.white, fontSize: 15),)),
//                               ],
//                             )))
//
//                   ],
//                 ),
//               ),
//             );
//           }
//       ),
//     );
//   }
// }
//
