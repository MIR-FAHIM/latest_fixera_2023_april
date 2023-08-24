import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../repositories/saved_rep.dart';
import '../../../../../utils/ui_support.dart';


class CreateWorkOrderController extends GetxController {
  //TODO: Implement SplashscreenController
  var JobData = TextEditingController().obs;
  var projectTitleController = TextEditingController().obs;
  var companyNameController = TextEditingController().obs;
  var companyAddressController = TextEditingController().obs;
  var companyPhoneController = TextEditingController().obs;
  var companyReprensentativeNameController = TextEditingController().obs;
  var companyRepJobData = TextEditingController().obs;
  var jobName = TextEditingController().obs;
  var companyRepPhoneController = TextEditingController().obs;

  final rcvEmail = TextEditingController().obs;
  final company_name = TextEditingController().obs;
  final company_rep_name = TextEditingController().obs;
  final company_address = TextEditingController().obs;
  final company_mobile = TextEditingController().obs;
  final company_email = TextEditingController().obs;
  final vendor_name = TextEditingController().obs;
  final vendor_address = TextEditingController().obs;
  final vendor_mobile = TextEditingController().obs;
  final work_order_desc = TextEditingController().obs;
  final total_amount = TextEditingController().obs;
  final work_order_crew = TextEditingController().obs;
  final work_order_crew_start = TextEditingController().obs;
  final work_order_crew_end = TextEditingController().obs;
  final customer_name = TextEditingController().obs;
  final customer_address = TextEditingController().obs;
  final com_rep_name = TextEditingController().obs;
  final com_rep_email = TextEditingController().obs;
  final com_rep_phone = TextEditingController().obs;
  final work_order_total_amount = TextEditingController().obs;
  final images = TextEditingController().obs;
  final title = TextEditingController().obs;
  final rate = TextEditingController().obs;
  final quantity = TextEditingController().obs;
  final final_amount = TextEditingController().obs;

  // list
  final work_order_metarial_qty = TextEditingController().obs;
  final workOrdermtarialQty = <String>[].obs;
  final work_order_metarial_unit = TextEditingController().obs;
  final workOrderUnit = <String>[].obs;
  final work_order_metarial_desc = TextEditingController().obs;
  final workOrderDesc = <String>[].obs;
  final visible = 0.obs;
  final checkLabour = false.obs;
  final checkMaterial = false.obs;
  final material = <TextFieldData>[].obs;
  DateTime? selectedDay;
  DateTime selectedCheckinDate = DateTime.now();
  DateTime selectedCheckoutDate = DateTime.now();
  var startDate = ''.obs;
  final dateInput = TextEditingController().obs;
  final endDateInput = TextEditingController().obs;
  var endDate = ''.obs;
  var myFormat = DateFormat('yyyy-MM-dd');

  @override
  Future<void> onInit() async {
    material.add(TextFieldData());

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }
  void workOrderqty(int index, int value) {

      material[index].workOrderqty = value;

  }

  void workOrderunit(int index, String value) {

      material[index].workOrderunit = value;

  }

  void workOrderdesc(int index, String value) {

      material[index].workOrderdesc = value;

  }
  createWorkOrderController() {
    visible.value++;
  try{
    SavedRepRepository()
        .createWorkOrder(
      rcvEmail: rcvEmail.value.text,
      company_name: company_name.value.text,
      company_address: company_address.value.text,

      job_name: jobName.value.text,
      work_order_crew: work_order_crew.value.text,
      work_order_crew_start: work_order_crew_start.value.text,
      work_order_crew_end: work_order_crew_end.value.text,
      customer_name: customer_name.value.text,
      customer_address: customer_address.value.text,
      com_rep_name: com_rep_name.value.text,
      com_rep_email: com_rep_email.value.text,
      com_rep_phone: com_rep_phone.value.text,
      work_order_total_amount: work_order_total_amount.value.text,
      work_order_desc: work_order_desc.value.text,

      //List
      work_order_metarial_qty: workOrdermtarialQty.value,
      work_order_metarial_unit: workOrderUnit.value,
      work_order_metarial_desc: workOrderDesc.value,


    )
        .then((value) {
      if (value["error"] == false) {
        Get.showSnackbar(Ui.successSnackBar(
            message:"Work Order Sent", title: 'Success'.tr));
        clearFormData();
        visible.value = 0;
      } else {
        visible.value = 0;
      }
      print("create Work Order ${value}");
    });
    }catch(e){
    visible.value = 0;
  }

  }

  clearFormData(){
     JobData.value.clear();
     projectTitleController.value.clear();
     companyNameController.value.clear();
     companyAddressController.value.clear();
     companyPhoneController.value.clear();
     companyReprensentativeNameController.value.clear();
     companyRepJobData.value.clear();
     jobName.value.clear();
     companyRepPhoneController.value.clear();

     rcvEmail.value.clear();
     company_name.value.clear();
     company_rep_name.value.clear();
     company_address.value.clear();
     company_mobile.value.clear();
     company_email.value.clear();
     vendor_name.value.clear();
     vendor_address.value.clear();
     vendor_mobile.value.clear();
     work_order_desc.value.clear();
     total_amount.value.clear();
     work_order_crew.value.clear();
     work_order_crew_start.value.clear();
     work_order_crew_end.value.clear();
     customer_name.value.clear();
     customer_address.value.clear();
     com_rep_name.value.clear();
     com_rep_email.value.clear();
     com_rep_phone.value.clear();
     work_order_total_amount.value.clear();
     images.value.clear();
     title.value.clear();
     rate.value.clear();
     quantity.value.clear();
     final_amount.value.clear();

    // list
     work_order_metarial_qty.value.clear();

     work_order_metarial_unit.value.clear();

     work_order_metarial_desc.value.clear();
     workOrderDesc.value.clear();



     material.value.clear();



     dateInput.value.clear();
     endDateInput.value.clear();
  }

  Future<void> selectCheckInDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckinDate,
      firstDate: DateTime(1920, 8),
      lastDate: DateTime(2100),);
    if (picked != null && picked != selectedCheckinDate) {
      selectedCheckinDate = picked;
    }
    dateInput.value.text = "${myFormat.format(selectedCheckinDate)}";
  }
  Future<void> selectCheckOutDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckoutDate,
      firstDate: DateTime(1920, 8),
      lastDate: DateTime(2100),);
    if (picked != null && picked != selectedCheckoutDate) {
      selectedCheckoutDate = picked;
    }
    endDateInput..value.text = myFormat.format(selectedCheckoutDate);
  }

}

class TextFieldData {
  int workOrderqty;
  String workOrderunit;
  String workOrderdesc;

  TextFieldData({this.workOrderqty = 0, this.workOrderunit = '', this.workOrderdesc = ''});
}