import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:latest_fixera_2023/modules/drawer/referral/controller/referal_controller.dart';


class DataTableWidget extends GetWidget<ReferalController> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
      () {
          return Container(
              width: Get.width,
              child: DataTable(
                dividerThickness: 1,
                columnSpacing: 6,
                columns: [
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('is Purchased?')),
                  DataColumn(label: Text('Referral at')),

                ],

              rows:controller.referralListUsed
                  .value! // Loops through dataColumnText, each iteration assigning the value to element
                  .map(
                ((element) => DataRow(
                  color: MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                        // Set color based on selected state
                        if (states.contains(MaterialState.selected)) {
                          return Colors.blue
                              .withOpacity(0.5); // Color when selected
                        }
                        return Colors.green
                            .withOpacity(.1); // Use default color
                      }),
                  cells: <DataCell>[

                    DataCell(Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 8.0,
                          horizontal: 0.0), // Add padding to Service cell

                      width: Get.width *
                          0.3, // Adjust width to give more space to Service
                      child: Text(element!.referredUserName,
                          style:
                          TextStyle(fontWeight: FontWeight.normal, fontSize: 12)),
                    )),

                    DataCell(Container(
                      width: Get.width * 0.15,
                      child:  Text(element.isPurchased.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.normal, color: Colors.green))

                    )),
                    DataCell( Text(DateFormat('yMMMMd')
                        .format(element.referredAt!), style: TextStyle(fontSize: 12),),),
                  ],
                )),
              )
                  .toList(),
              ),
            );
        }
      )

    );
  }
}