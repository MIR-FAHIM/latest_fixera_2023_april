
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/drawer/buy_credit/controller/buy_credit_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/create_estimation/controller/create_estimation_controller.dart';
import 'package:latest_fixera_2023/modules/drawer/post_a_project/controller/post_project_controller.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/lead_marketplace/view/see_vendor_profile.dart';
import 'package:latest_fixera_2023/modules/search_module/controller/search_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/services/auth_services.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';

import '../../../widget/block_button.dart';
import '../../web_view/job_details/job_details_webview.dart';


class SearchView extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: AppColors.primaryColor,
        centerTitle: true,
      ),
      backgroundColor: AppColors.backgroundColor,
      body: Obx(
              () {
            return SingleChildScrollView(
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       height: MediaQuery.of(context).size.height * .15,
                       width: MediaQuery.of(context).size.width *8,
                       color: Colors.white,
                       child: Row(
                         children: [

                           Checkbox(
                             value: controller.contractorChecked.value,
                             onChanged: ( newValue) {
                               controller.contractorChecked.value = newValue!;
                               controller.marketPlaceChecked.value = false;
                               controller.brwsJobChecked.value = false;
                             },
                           ),
                           Text("Contractor", style: TextStyle(fontSize: 8),),
                           Checkbox(
                             value: controller.marketPlaceChecked.value,
                             onChanged: ( newValue) {
                               controller.marketPlaceChecked.value = newValue!;
                               controller.contractorChecked.value = false;
                               controller.brwsJobChecked.value = false;
                             },
                           ),
                           Text("MarketPlace",style: TextStyle(fontSize: 8)),
                           Checkbox(
                             value: controller.brwsJobChecked.value,

                             onChanged: ( newValue) {
                               controller.brwsJobChecked.value = newValue!;
                               controller.contractorChecked.value = false;
                               controller.marketPlaceChecked.value = false;
                             },
                           ),
                           Text("Browse Projects", style: TextStyle(fontSize: 8)),
                         ],
                       ),



                     ),
                     Container(
                       height: 30,
                       width: 250,
                       //color: Colors.white,

                       child: TextFormField(
                         controller: controller.searchController.value,
                         onChanged: controller.updateSearchTextDebounced(controller.searchController.value.text),



                         maxLines: 1,
                         //controller: controller.searchTextController.value,
                         decoration:  InputDecoration(
                           fillColor: Colors.green,
                           focusColor: Colors.green,
                           hoverColor: Colors.green,
                           focusedBorder:OutlineInputBorder(
                             borderSide:  BorderSide(color: Colors.green, width: 2.0),
                             borderRadius: BorderRadius.circular(25.0),
                           ),
                           labelText: 'I am looking for',
                           labelStyle: TextStyle(color: Colors.green),
                           suffixIcon: InkWell(
                             onTap: (){
                               controller.searchListController(controller.searchController.value.text);
                             },
                             child: Icon(
                               Icons.search,
                               color: Colors.green,
                             ),
                           ),
                           enabledBorder: OutlineInputBorder(
                             borderRadius: BorderRadius.circular(25.0),
                             borderSide: BorderSide(
                               color: Colors.green,
                               width: 2.0,
                             ),
                           ),
                           border: OutlineInputBorder(

                             borderSide:  BorderSide(color: Colors.white, width: 2.0),

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
                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Container(
                         height: MediaQuery.of(context).size.height *.2,
                         child: ListView(
                        //   physics: NeverScrollableScrollPhysics(),
                        
                           children: [
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("Skill"),
                                 InkWell(
                                   onTap: (){
                                     if(controller.skillDrop.value == false){
                                       controller.skillDrop.value = true;
                                     }else {
                                       controller.skillDrop.value = false;
                                     }
                                   },
                                     child: Icon(Icons.arrow_drop_down_circle_outlined, color: controller.skillDrop.value == true ? AppColors.ccsYelow : AppColors.textColorBlack)),
                               ],
                             ),
                             SizedBox(height: 10,),
                             controller.skillDrop.value == true ?
                             Container(
                               height: MediaQuery.of(context).size.height *.2,
                               child: ListView.builder(
                                   physics: NeverScrollableScrollPhysics(),
                                 itemCount: controller.skillList.value.length,
                                   itemBuilder: (context, index){
                                   var data = controller.skillList.value[index];
                                   return InkWell(
                                     onTap: (){
                                       controller.addOrRemoveDataInSkillList(data.id!);

                                     },
                                     child: Obx(
                                        () {
                                         return Card(
                                           color:  controller.selectListOfSkill.contains(data.id) ? AppColors.ccsYelow : Colors.white,
                                           child: ListTile(
                                             title: Text(data.title!),
                                           ),
                                         );
                                       }
                                     ),
                                   );
                                   }),
                             ) : Container(),
                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("Location"),
                                 InkWell(
                                     onTap: (){
                                       if(controller.locationDrop.value == false){
                                         controller.locationDrop.value = true;
                                       }else {
                                         controller.locationDrop.value = false;
                                       }
                                     },
                                     child: Icon(Icons.arrow_drop_down_circle_outlined, color: controller.locationDrop.value == true ? AppColors.ccsYelow : AppColors.textColorBlack)),
                               ],
                             ),
                             SizedBox(height: 10,),
                             controller.locationDrop.value == true ?
                             Container(
                               height: MediaQuery.of(context).size.height *.2,
                               child: ListView.builder(
                                   physics: NeverScrollableScrollPhysics(),
                                   itemCount: controller.locationList.value.length,
                                   itemBuilder: (context, index){
                                     var data = controller.locationList.value[index];
                                     return InkWell(
                                       onTap: (){
                                         controller.addOrRemoveDataInLocationlList(data.id!);
                                       },

                                       child: Obx(
                                          () {
                                           return Card(
                                             color:  controller.selectCardListInLocation.contains(data.id) ? AppColors.ccsYelow : Colors.white,
                                             child: ListTile(
                                               title: Text(data.title!),
                                             ),
                                           );
                                         }
                                       ),
                                     );
                                   }),
                             ) : Container(),



                             Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Text("Language"),
                                 InkWell(
                                     onTap: (){
                                       if(controller.languageDrop.value == false){
                                         controller.languageDrop.value = true;
                                       }else {
                                         controller.languageDrop.value = false;
                                       }
                                     },
                                     child: Icon(Icons.arrow_drop_down_circle_outlined, color: controller.languageDrop.value == true ? AppColors.ccsYelow : AppColors.textColorBlack)),
                               ],
                             ),
                             SizedBox(height: 10,),
                             controller.languageDrop.value == true ?
                             Container(
                               height: MediaQuery.of(context).size.height *.3,
                               child: ListView.builder(
                                   physics: NeverScrollableScrollPhysics(),
                                   itemCount: controller.languageList.value.length,
                                   itemBuilder: (context, index){
                                     var data = controller.languageList.value[index];
                                     return InkWell(
                                       onTap: (){
                                         controller.addOrRemoveDataInLaqnguageList(data.id!);
                                       },
                                       child: Obx(
                                          () {
                                           return Card(
                                             color:  controller.selectCardListInLanguage.contains(data.id)  ? AppColors.ccsYelow:Colors.white,
                                             child: ListTile(
                                               title: Text(data.title!),
                                             ),
                                           );
                                         }
                                       ),
                                     );
                                   }),
                             ) : Container(),
                           ],
                         ),
                       ),
                     ),
                     BlockButtonWidget(
                       width: Get.size.width * .2,
                       color: AppColors.textColorGreen,
                       onPressed: (){
                        // Get.back();
                       },
                       text: Text(
                         "Apply",
                         style: const TextStyle(
                           color: Colors.white,
                         ),
                       ),
                     ),
                     Padding(
                       padding: const EdgeInsets.all(4.0),
                       child: Container(
                         height:MediaQuery.of(context).size.height * .4,
                         child:  controller.contractorChecked.value == true ?
                         Obx(
                            () {
                             return ListView.builder(
                                 itemCount: controller.searchController.value.text.isEmpty ? controller.contractorList.value.length:controller.filterdContractorList.value.length,
                                 itemBuilder: (BuildContext context , index){
                                   var data =  controller.searchController.value.text.isEmpty ? controller.contractorList.value[index]:controller.filterdContractorList.value[index];
                                   return

                                     Card(
                                       elevation: 5,

                                       child: Padding(
                                         padding: const EdgeInsets.all(8.0),

                                           child:

                                           Center(
                                             child: Container(
                                               height: MediaQuery.of(context).size.height * .2,
                                               width: MediaQuery.of(context).size.width * .6,
                                               child: Center(
                                                 child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,

                                                   children: [
                                                     Container(
                                                       child: Column(
                                                         children: [
                                                           Row(
                                                             //  mainAxisAlignment: MainAxisAlignment.start,
                                                             children: [
                                                               Icon(Icons.verified_user, color: Colors.green,),
                                                               SizedBox(width: 10,),
                                                               Text(data.name!, style: TextStyle(fontSize: 14),),
                                                             ],
                                                           ),
                                                           Row(
                                                             //mainAxisAlignment: MainAxisAlignment.center,
                                                             children: [
                                                               Icon(Icons.title, color:Colors.green),
                                                               SizedBox(width: 10,),
                                                               Container(
                                                                 height: MediaQuery.of(context).size.height * .04,
                                                                 width: MediaQuery.of(context).size.width * .4,
                                                                 child: Text(data.tagline!,
                                                                   maxLines: 2,
                                                                   style: TextStyle(fontSize: 14),),
                                                               ),
                                                             ],
                                                           ),
                                                           Row(
                                                             //mainAxisAlignment: MainAxisAlignment.center,

                                                             children: [
                                                               Icon(Icons.price_check, color:Colors.green),
                                                               SizedBox(width: 10,),
                                                               Text(data.hourlyRate!.toString(), style: TextStyle(fontSize: 14),),
                                                             ],
                                                           ),

                                                         ],
                                                       ),
                                                     ),



                                                   ],
                                                 ),
                                               ),),
                                           ),



                                       ),




                                     );
                                 });
                           }
                         )
                             : controller.marketPlaceChecked.value == true ?
                         Obx(
                            () {
                             return ListView.builder(
                                 itemCount: controller.searchController.value.text.isEmpty ? controller.mySavedFreelancerListJobs.value.length:controller.filterdMarketPlaceList.value.length,
                                 itemBuilder: (BuildContext context , index){
                                   var data = controller.searchController.value.text.isEmpty ? controller.mySavedFreelancerListJobs.value[index]:controller.filterdMarketPlaceList.value[index];
                                   return

                                     Card(
                                       elevation: 5,

                                       child: Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: badges.Badge(
                                           badgeStyle: badges.BadgeStyle(
                                             badgeColor: data.isFavourite == true ? Colors.red.withOpacity(.7):Colors.grey,
                                             borderRadius: BorderRadius.circular(0),
                                           ),
                                           badgeContent: Icon(Icons.favorite_outlined, color: Colors.white, size: 15,),
                                           child:

                                           Center(
                                             child: Container(
                                               height: MediaQuery.of(context).size.height * .3,
                                               width: MediaQuery.of(context).size.width * .4,
                                               child: Center(
                                                 child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,

                                                   children: [
                                                     Container(
                                                       child: Column(
                                                         children: [
                                                           Row(
                                                             //  mainAxisAlignment: MainAxisAlignment.start,
                                                             children: [
                                                               Icon(Icons.verified_user, color: Colors.green, size: 30,),
                                                               SizedBox(width: 10,),
                                                               Text(data.name!, style: TextStyle(fontSize: 18),),
                                                             ],
                                                           ),
                                                           Row(
                                                             //mainAxisAlignment: MainAxisAlignment.center,
                                                             children: [
                                                               Icon(Icons.title, color:Colors.green,size: 30,),
                                                               SizedBox(width: 10,),
                                                               Text(data.tagLine!,style: TextStyle(fontSize: 18),),
                                                             ],
                                                           ),
                                                           Row(
                                                             //mainAxisAlignment: MainAxisAlignment.center,

                                                             children: [
                                                               Icon(Icons.price_check, color:Colors.green, size: 30,),
                                                               SizedBox(width: 10,),
                                                               Text(data.hourlyRate!.toString(), style: TextStyle(fontSize: 18),),
                                                             ],
                                                           ),
                                                           Row(
                                                             //mainAxisAlignment: MainAxisAlignment.center,
                                                             children: [
                                                               Icon(Icons.rate_review, color:Colors.green, size: 30,),
                                                               SizedBox(width: 10,),
                                                               Text(data.rating!, style: TextStyle(fontSize: 18),),
                                                             ],
                                                           ),


                                                         ],
                                                       ),
                                                     ),

                                                     SizedBox(height: 20,),



                                                   ],
                                                 ),
                                               ),),
                                           ),


                                         ),
                                       ),




                                     );
                                 });
                           }
                         )
                             :
                         Obx(
                           () {
                             return ListView.builder(
                                 itemCount: controller.searchController.value.text.isEmpty ? controller.mySavedItemsListJobs.value.length:controller.filterdBrwsProjectList.value.length,
                                 itemBuilder: (BuildContext context , index){
                                   var data = controller.searchController.value.text.isEmpty ? controller.mySavedItemsListJobs.value[index]:controller.filterdBrwsProjectList.value[index];
                                   return

                                     Card(
                                       elevation: 5,

                                       child: Padding(
                                         padding: const EdgeInsets.all(8.0),
                                         child: badges.Badge(
                                           badgeStyle: badges.BadgeStyle(
                                             badgeColor: data.isFavourite == true ? Colors.red.withOpacity(.7):Colors.grey,
                                             borderRadius: BorderRadius.circular(0),
                                           ),
                                           badgeContent: Icon(Icons.favorite_outlined, color: Colors.white, size: 15,),
                                           child:

                                           Center(
                                             child: Container(
                                               height: MediaQuery.of(context).size.height * .3,
                                               width: MediaQuery.of(context).size.width * .7,
                                               child: Center(
                                                 child: Column(
                                                   crossAxisAlignment: CrossAxisAlignment.start,

                                                   children: [
                                                     Container(
                                                       child: Column(
                                                         children: [
                                                           Row(
                                                             //  mainAxisAlignment: MainAxisAlignment.start,
                                                             children: [
                                                               Icon(Icons.verified_user, color: Colors.green,),
                                                               SizedBox(width: 10,),
                                                               Text(data.employer!, style: TextStyle(fontSize: 14),),
                                                             ],
                                                           ),
                                                           Row(
                                                             //mainAxisAlignment: MainAxisAlignment.center,
                                                             children: [
                                                               Icon(Icons.title, color:Colors.green),
                                                               SizedBox(width: 10,),
                                                               Text(data.title!,style: TextStyle(fontSize: 14),),
                                                             ],
                                                           ),
                                                           Row(
                                                             //mainAxisAlignment: MainAxisAlignment.center,

                                                             children: [
                                                               Icon(Icons.price_check, color:Colors.green),
                                                               SizedBox(width: 10,),
                                                               Text(data.price!.toString(), style: TextStyle(fontSize: 14),),
                                                             ],
                                                           ),
                                                           Row(
                                                             //mainAxisAlignment: MainAxisAlignment.center,
                                                             children: [
                                                               Icon(Icons.location_on_outlined, color:Colors.green),
                                                               SizedBox(width: 10,),
                                                               Text(data.location!, style: TextStyle(fontSize: 14),),
                                                             ],
                                                           ),
                                                           Row(
                                                             //mainAxisAlignment: MainAxisAlignment.center,
                                                             children: [
                                                               Icon(Icons.copy, color:Colors.green),
                                                               SizedBox(width: 10,),
                                                               Text(data.type!,style: TextStyle(fontSize: 14),),
                                                             ],
                                                           ),
                                                           Row(
                                                             // mainAxisAlignment: MainAxisAlignment.center,
                                                             children: [
                                                               Icon(Icons.punch_clock_rounded, color:Colors.green),
                                                               SizedBox(width: 10,),
                                                               Text(data.duration!, style: TextStyle(fontSize: 14),),
                                                             ],
                                                           ),
                                                         ],
                                                       ),
                                                     ),

                                                     SizedBox(height: 20,),
                                                     Get.find<AuthService>().currentUser.value.userInfo!.roleName ==
                                                         "contractor" ?
                                                     InkWell(
                                                       onTap: () {
                                                         if (data.paymentStatus ==
                                                             1) {
                                                           controller.jobURL.value =
                                                           data.jobUrl!;
                                                           controller
                                                               .callWebController();
                                                           Get.to(
                                                               JobDetailsWebView(controller.jobURL.value));
                                                         } else {
                                                           controller.jobURL.value =
                                                           data.jobUrl!;
                                                           controller
                                                               .callWebController();
                                                           Get.to(
                                                               JobDetailsWebView(controller.jobURL.value));
                                                        //   controller.checkPaymentStatus(id: data.id, slug: data.slug, status: data.paymentStatus);
                                                           // controller
                                                           //     .callPublicController(
                                                           //         data.slug
                                                           //             .toString(),
                                                           //         data.id!,
                                                           //         "public");
                                                         }

                                                         //controller.visible.value++;
                                                       },
                                                       child: Center(
                                                         child: AnimatedContainer(
                                                           duration:
                                                           Duration(seconds: 2),
                                                           height: 30,
                                                           width: 100,
                                                           decoration: BoxDecoration(
                                                               color: data.paymentStatus ==
                                                                   1
                                                                   ? Colors.purple
                                                                   .withOpacity(.6)
                                                                   : AppColors
                                                                   .textColorGreen,
                                                               borderRadius:
                                                               BorderRadius
                                                                   .circular(10)),
                                                           alignment: Alignment.center,
                                                           child: Text(
                                                             "View Job",
                                                             style: TextStyle(
                                                               color: AppColors
                                                                   .backgroundColor,
                                                               fontSize: 12,
                                                             ),
                                                           ),
                                                         ),
                                                       ),
                                                     ) : Container(),

                                                   ],
                                                 ),
                                               ),),
                                           ),


                                         ),
                                       ),




                                     );
                                 });
                           }
                         )
                       ),
                     ),




                   ],
                 ),
               ),

            );
          }
      ),


    );
  }
}
