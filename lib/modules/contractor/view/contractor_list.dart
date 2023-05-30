
import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/home/controller/home_view_controller.dart';
import 'package:latest_fixera_2023/modules/splash/controller/splash_screen_controller.dart';
import 'package:latest_fixera_2023/utils/AppColors/app_colors.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:latest_fixera_2023/widget/custom_appbar.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ContractorListScreen extends GetView<HomeViewController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    Get.find<HomeViewController>();
    return Scaffold(
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
                          height:MediaQuery.of(context).size.height * .8,
                          child: ListView.separated(
                              itemCount: controller.contractorList.length,
                              separatorBuilder:
                                  (context, index) {
                                return SizedBox(
                                  height: 10,
                                );
                              },
                              itemBuilder: (BuildContext context , index){
                                var data = controller.contractorList[index];
                                return Card(
                                  elevation: 5,

                                  child:  badges.Badge(
                                    badgeStyle: badges.BadgeStyle(
                                      badgeColor: Colors.grey,
                                      borderRadius: BorderRadius.circular(0),
                                    ),
                                    badgeContent: Icon(Icons.favorite_outline, color: Colors.white, size: 18,),

                                
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                          height: MediaQuery.of(context).size.height * .13,
                                          width: MediaQuery.of(context).size.width * .9,
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Container(
                                                    height: 50,
                                                    width: 50,
                                                    color: Colors.grey,
                                                    child: Center(
                                                      child: data.avatar == "0" ?
                                                      Container(
                                                        color: Colors.grey.shade200,

                                                        height: 60,
                                                        width: 60,
                                                        child: Center(
                                                          child: Text("255x255", style: TextStyle(fontSize: 10),),
                                                        ),

                                                      ) :
                                                      CachedNetworkImage(
                                                        imageUrl: data.avatar,
                                                        placeholder: (context, url) => CircularProgressIndicator(),
                                                        errorWidget: (context, url, error) => Icon(Icons.error, color: Colors.white,),
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 10,),
                                                  Column(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(Icons.verified_user, color: Colors.green,),
                                                          Text(data.name!),
                                                        ],
                                                      ),
                                                      Container(

                                                        height: 40,
                                                        width: 200,
                                                        child: Row(
                                                          children: [
                                                            Icon(Icons.title, color:Colors.green),
                                                            Expanded(child: Text(data.tagline!, maxLines: 2,)),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,


                                                        children: [
                                                          Container(
                                                            width: 150,
                                                            child: Row(
                                                              children: [
                                                                Icon(Icons.price_check, color:Colors.green),
                                                                Text("\$${data.hourlyRate!.toString()}"+ "/hr"),
                                                              ],
                                                            ),
                                                          ),



                                      Container(
                                        height: 20,
                                        width: 100,
                                        child: RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          itemSize: 12,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemPadding: EdgeInsets.symmetric(horizontal: 0.0),
                                          itemBuilder: (context, _) => Container(
                                            height: 5,
                                            width: 5,
                                            child: Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                              size: 5,
                                            ),
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                      )
                                                        ],
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),







                                            ],
                                          ),
                                        ),
                                      
                                    ),
                                  ),

                                );
                              }),
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
