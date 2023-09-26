import 'dart:async';
import 'dart:io';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'dart:convert';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:latest_fixera_2023/modules/web_view/project_web/project_tab.dart';
import 'package:latest_fixera_2023/repositories/saved_rep.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:latest_fixera_2023/utils/ui_support.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import '../../../../repositories/saved_rep.dart';
import '../../../../services/auth_services.dart';
import '../../../../utils/ui_support.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
class CreateEstimationController extends GetxController {
  //TODO: Implement SplashscreenController
  var receiver_email = TextEditingController().obs;
  var project_title = TextEditingController().obs;
  var company_name = TextEditingController().obs;
  var company_address = TextEditingController().obs;
  var company_phone = TextEditingController().obs;
  var company_representive_name = TextEditingController().obs;
  var company_representive_email = TextEditingController().obs;
  var company_representive_adddress = TextEditingController().obs;
  var company_representive_phone = TextEditingController().obs;
  var estimation_description = TextEditingController().obs;
  var estimation_policy = TextEditingController().obs;
  final signatureDate = TextEditingController().obs;
  final estimationproducttitleList = <String>[].obs;
  final estimationcarditleList = <String>[].obs;
  final estimationproductdescList = <String>[].obs;
  final estimationproductqtyList =  <String>[].obs;
  final estimationProductPriceList =  <int>[].obs;
  final estimationproducttotalList =  <String>[].obs;

  final estimation_product_title = TextEditingController().obs;
  final estimation_card_title = TextEditingController().obs;
  final estimation_product_desc = TextEditingController().obs;
  final estimation_product_qty = TextEditingController().obs;
  final estimation_product_price = TextEditingController().obs;
  final estimation_product_total = TextEditingController().obs;
  final estimation_final_amount = TextEditingController().obs;



  final projectCat = [].obs;
  final selectedLangList = [].obs;

  final visible = 0.obs;
  final checkLabour = false.obs;
  final checkMaterial = false.obs;
  final GlobalKey<SfSignaturePadState> signatureGlobalKey = GlobalKey();
  var bytes;
  final base64Image = "".obs;
  final material = <TextFieldDataEstimation>[].obs;
  // project data
  var searchController = TextEditingController().obs;
  final catSelect = "".obs;
  final measurementProjectSelect = "".obs;
  final freelancerLevelProjectSelect = "".obs;
  final projectDurationProjectSelect = "".obs;
  final customPriceProjectSelect = "".obs;
  final expirationSelect = "".obs;
  final insComSelect = "".obs;
  final numStoriesSelect = "".obs;
  final ageRoodSelect = "".obs;
  final typeOfRoofSelect = "".obs;
  final languageSelect = "".obs;
  final propertyTypeSelect = "".obs;
  final locationSelect = "".obs;
  final locationId = "".obs;




  final catDataProject = <MapEntry<String, String>>[].obs;
  final measurementProject = <MapEntry<String, String>>[].obs;
  final freelancerLevelProject = <MapEntry<String, String>>[].obs;
  final languageList = <MapEntry<String, String>>[].obs;

  final projectDurationProject = <MapEntry<String, String>>[].obs;
  final customPriceProject = <MapEntry<String, String>>[].obs;
  final expirationList = <MapEntry<String, int>>[].obs;
  final insCompanyList = <MapEntry<String, String>>[].obs;
  final locationList = <MapEntry<String, String>>[].obs;
  final ageRoofList = [].obs;

  final numOfStories = [].obs;
  final typeOfRoofList = <MapEntry<String, String>>[].obs;

  final propertyTypeList = <MapEntry<String, String>>[].obs;

  // for post a job

  final projectTitlePostAJob = TextEditingController().obs;
  final customPrice = TextEditingController().obs;
  final measurementValue = TextEditingController().obs;
  final howManySquare = TextEditingController().obs;
  final projectContactName = TextEditingController().obs;
  final projectPhoneNo = TextEditingController().obs;
  final projectEmail = TextEditingController().obs;
  //
  final projectCost = TextEditingController().obs;
  final bidingStart = TextEditingController().obs;
  final bidingEnd = TextEditingController().obs;
  final projectDetails = TextEditingController().obs;
  final postalCode = TextEditingController().obs;
  final yourAddress = TextEditingController().obs;
//
  final isFeatured = false.obs;
  final isStatus = false.obs;
  final isAttachment = false.obs;
// image
  var cropImagePath = ''.obs;
  var myFormat = DateFormat('yyyy-MM-dd');
  var cropImageSize = ''.obs;
  var selectedImagePath = ''.obs;
  var selectedImageSize = ''.obs;
  var imageData = "".obs;
  late File imageFIle;
  final imageList = [].obs;
  // Crop code
  DateTime? selectedDay;
  DateTime selectedCheckinDate = DateTime.now();
  DateTime selectedCheckoutDate = DateTime.now();
  var startDate = ''.obs;
  TextEditingController startDateInput = TextEditingController();
  TextEditingController endDateInput = TextEditingController();
  var endDate = ''.obs;
  // Compress code
  var compressImagePath = ''.obs;
  var compressImageSize = ''.obs;






  @override
  Future<void> onInit() async {
    postJobProjectDataListController();
    projectContactName.value.text = Get.find<AuthService>().currentUser.value.userInfo!.firstName!;
    projectPhoneNo.value.text = Get.find<AuthService>().currentUser.value.userInfo!.phone!;

    estimationproducttitleList.clear();
     estimationcarditleList.clear();
     estimationproductdescList.clear();
     estimationproductqtyList.clear();
    estimationProductPriceList.clear();
     estimationproducttotalList.clear();
    material
        .add(TextFieldDataEstimation());
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
  }

  void productQuantityFunction(int index, int value) {

    material[index].productQt = value.toString();
    estimationproductqtyList.value.add(value.toString());
    print("new list int++++++++++++++++++++++${estimationproductqtyList.value}");

  }

  void cardTitleFunction(int index, String value) {
    material[index].cardTitle = value;
    estimationproductdescList.value.add(value);
    print("new list String++++++++++++++++++++++${estimationproductdescList.value}");

  }
  void priceFunction(int index, int value) {


    material[index].price = value;
    estimationProductPriceList.value.add(value);
    print("new list String++++++++++++++++++++++${estimationProductPriceList.value}");
    material[index].price = value;
    int a = material.value.fold(0, (previousValue, element) => previousValue + element.price);
estimation_final_amount.value.text =  a.toString();


  }
  void desFunction(int index, String value) {
    material[index].productDes = value;

    estimationproductdescList.value.add(value);
    print("new list String++++++++++++++++++++++${estimationproductdescList.value}");
  }
  void getImage(ImageSource imageSource) async {
    selectedImagePath = ''.obs;
    selectedImageSize = ''.obs;

    // Crop code
    cropImagePath = ''.obs;
    cropImageSize = ''.obs;

    // Compress code
    compressImagePath = ''.obs;
    compressImageSize = ''.obs;

    final pickedFile = await ImagePicker().getImage(source: imageSource);
    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;

      selectedImageSize.value =
          ((File(selectedImagePath.value)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2) +
              " Mb";
      print("my invoice image list is 111 ${imageList.value}");
      // Crop
      final cropImageFile = await ImageCropper().cropImage(
          sourcePath: selectedImagePath.value,
          maxWidth: 512,
          maxHeight: 512,
          compressFormat: ImageCompressFormat.jpg);
      cropImagePath.value = cropImageFile!.path;
      cropImageSize.value =
          ((File(cropImagePath.value)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2) +
              " Mb";
      print("my invoice image list is 2222 ${imageList.value}");
      // Compress
      print('compress path: ${cropImagePath.value}');
      final dir = Directory.systemTemp;
      final targetPath =
          '${dir.absolute.path}/${cropImagePath.value.split('/').last}';
      var compressedFile = await FlutterImageCompress.compressAndGetFile(
          cropImagePath.value, targetPath,
          quality: 100, keepExif: false, autoCorrectionAngle: true, rotate: 0);
      print("my invoice image list is 3333 ${imageList.value}");
      compressImagePath.value = compressedFile!.path;
      print("my invoice image list is 4444 ${imageList.value}");
      compressImageSize.value =
          ((File(compressImagePath.value)).lengthSync() / 1024 / 1024)
              .toStringAsFixed(2) +
              " Mb";
      List<int> bytes = compressedFile.readAsBytesSync();
      imageData.value = base64Encode(bytes);
      print("my invoice image list is 5555 ${compressImagePath.value}");
      imageList.clear();
      print("my invoice image list is 66666 ${compressImagePath.value}");
      imageList.add(File(compressImagePath.value));
      print("my invoice image list is 777 ${imageList.value}");

      // uploadImage(compressedFile);
    } else {
      Get.snackbar('Error', 'No image selected',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white);
    }
  }

  clearTextCOntroller(){
     receiver_email.value.clear() ;
     project_title.value.clear();
     projectTitlePostAJob.value.clear();
     company_name.value.clear();
     company_address.value.clear();
     company_phone.value.clear();
     company_representive_name.value.clear();
     company_representive_email.value.clear();
     company_representive_adddress.value.clear();
     company_representive_phone.value.clear();
     estimation_description.value.clear();
     estimation_policy.value.clear();
     signatureDate.value.clear();
      estimation_product_title.value.clear();
      estimation_card_title.value.clear();
      estimation_product_desc.value.clear();
      estimation_product_qty.value.clear();
      estimation_product_price.value.clear();
      estimation_product_total.value.clear();
      estimation_final_amount.value.clear();
     estimationproducttitleList.clear();
    estimationcarditleList.clear();
    estimationproductdescList.clear();
    estimationproductqtyList.clear();
    estimationProductPriceList.clear();
    estimationproducttotalList.clear();
     projectTitlePostAJob.value.clear();
    // customPriceProjectSelect.value = "";
     customPrice.value.clear();
    // projectDurationProjectSelect.value = "";
    // catSelect.value = "";
     projectCost.value.clear();
     yourAddress.value.clear();
     bidingStart.value.clear();
     postalCode.value.clear();
     bidingEnd.value.clear();
     searchController.value.clear();
     //endDateInput.value.clear();
     imageData.value = "";
     startDateInput.clear();
      endDateInput.clear();
     material.value.clear();
  }
  createEstimationController(String signature) {
    visible.value++;


      SavedRepRepository()
          .createEstimation(
        signature: signature,
        receiver_email: receiver_email.value.text,
        project_title: project_title.value.text,
        company_name: company_name.value.text,
        company_address: company_address.value.text,
        company_phone: company_phone.value.text,
        company_representive_name: company_representive_name.value.text,
        company_representive_email: company_representive_email.value.text,
        company_representive_phone: company_representive_phone.value.text,
        estimation_description: estimation_description.value.text,
        estimation_final_amount: estimation_final_amount.value.text,
        estimation_policy: estimation_policy.value.text,
        //List
        estimation_product_title: estimationproductdescList.value,
        estimation_card_title: estimationproductdescList.value,
        estimation_product_desc: estimationproductdescList.value,
        estimation_product_qty: estimationproductqtyList.value,
        estimation_product_price: estimationproductqtyList.value,
        estimation_product_total: estimationproductqtyList.value,

      )
          .then((value) {
            try{
              if (value["error"] == false) {
                signatureGlobalKey.currentState!
                    .clear();
                Get.showSnackbar(Ui.successSnackBar(
                    message:value["results"][0]["success"], title: 'Success'.tr));
                clearTextCOntroller();
                visible.value = 0;
              } else {
                visible.value = 0;
              }
            }catch(e){
              print("error log in estimation $e");
            }

        print("create Estimation ${value}");
      });


  }

  createInvoiceController() {
    visible.value++;
    SavedRepRepository().createInvoiceMultipart(
      project_status:  "true",
      title: project_title.value,
      custom_price_type: "type",
      custom_price_value: customPrice.value,
      job_duration: projectDurationProjectSelect.value,
      freelancer_type: freelancerLevelProjectSelect.value,
      measurement_type: measurementProjectSelect.value,
      measurement_value: measurementValue.value.text,
      project_start_date: "",
      project_end_date: "",
      lead_expiration: "lead",
      lead_price: "lead",
      insurance_status: "",
      insurance_company: insComSelect.value,
      square_size: "size",
      age_of_roof: ageRoodSelect.value,
      roof_type: typeOfRoofSelect.value,
      property_type: propertyTypeSelect.value,
      lead_contact_name:"contact",
      lead_contact_phone: "phone",
      lead_contact_email: "email",
      expiry_of_lead: "",
      project_cost: projectCost.value,
      description: estimation_description.value,
      locations: "location",
      postal_code: "postal",
      address: company_address.value,
      project_hire_type: "yype",
      categories: "selec",
      languages: "lang",
      skills: "skills",
    ).then((value) {
      if (value["error"] == false) {
        Get.showSnackbar(Ui.successSnackBar(
            message:value["results"]["message"], title: 'Success'.tr));
        visible.value = 0;

      } else {
        visible.value = 0;
      }
      print("create invoice++++++ ${value}");
    });
  }

  void itemChange(String itemValue, bool isSelected) {

      if (isSelected) {
        projectCat.add(itemValue);
      } else {
        projectCat.remove(itemValue);
      }

  }
  void langChange(String itemValue, bool isSelected) {

    if (isSelected) {
      selectedLangList.add(itemValue);
    } else {
      selectedLangList.remove(itemValue);
    }

  }

  createJobProjectLeadMultipart() {
    visible.value++;
    SavedRepRepository()
        .createPostAjobMultipart(

       lead_contact_name: "lead_contact_phone",
       lead_contact_phone: "lead_contact_phone" ,
       lead_contact_address: "lead_contact_address",
       custom_price_type: "ss",
       title: projectTitlePostAJob.value.text,
       custom_price_value: customPrice.value,
       job_duration: projectDurationProjectSelect.value,
       freelancer_type: "dss",
       project_start_date: DateTime.now().toString(),
       project_end_date:DateTime.now().toString(),
       lead_expiration: "46",
       measurement_value: "46",
       measurement_type: "asd",
       project_cost: projectCost.value.text,
       public_bid_price: bidingStart.value.text,
       private_bid_price: bidingEnd.value.text,
       locations: locationId.value,
       postal_code: postalCode.value.text,
       address: yourAddress.value.text,
       is_featured: "true",
       show_attachments: "false",
       description: "rw",
       attachments: imageList.isEmpty ? null : imageList[0],
       categories:["1","2"],
       languages:["1","2"],





    )
        .then((value) {
      if (value["error"] == false) {
        Get.showSnackbar(Ui.successSnackBar(
            message:value["results"], title: 'Success'.tr));

        clearTextCOntroller();
        Get.to(ProjectTabBar(0));
        visible.value = 0;
      } else {
        visible.value = 0;
      }
      print("create post a job ${value}");
    });
  }

  createJobProjectLead() {
    visible.value++;
    SavedRepRepository()
        .postJobOrLead(

       project_status:  "true",
       title: project_title.value,
       custom_price_type: "type",
       custom_price_value: customPrice.value,
       job_duration: projectDurationProjectSelect.value,
       freelancer_type: freelancerLevelProjectSelect.value,
       measurement_type: measurementProjectSelect.value,
       measurement_value: measurementValue.value.text,
       project_start_date: "",
       project_end_date: "",
       lead_expiration: "lead",
       lead_price: "lead",
       insurance_status: "",
       insurance_company: insComSelect.value,
       square_size: "size",
       age_of_roof: ageRoodSelect.value,
       roof_type: typeOfRoofSelect.value,
       property_type: propertyTypeSelect.value,
       lead_contact_name:"contact",
       lead_contact_phone: "phone",
       lead_contact_email: "email",
       expiry_of_lead: "",
       project_cost: projectCost.value,
       description: estimation_description.value,
       locations: "location",
       postal_code: "postal",
       address: company_address.value,
       project_hire_type: "yype",
       categories: "selec",
       languages: "lang",
       skills: "skills",



    )
        .then((value) {
      if (value["error"] == false) {
        Get.showSnackbar(Ui.successSnackBar(
            message:"Job Posted Successfully", title: 'Success'.tr));
        visible.value = 0;
      } else {
        visible.value = 0;
      }
      print("create Estimation ${value}");
    });
  }
  postJobProjectDataListController(){
    print("hlw sukkur1");
    catDataProject.value.clear();
    typeOfRoofList.value.clear();
    propertyTypeList.value.clear();
    catDataProject.value.clear();
    catDataProject.value.clear();
           SavedRepRepository().postJobProjectList().then((value) {
             print("hlw sukkur2");
             catDataProject.value = value.results.categories.entries.toList();
             print("my all categories are ${ catDataProject.value[0].value.toString()}");
             catSelect.value = catDataProject.value[0].key.toString();
             //
             measurementProject.value = value.results.measurement.entries.toList();
             print("my all categories are ${ measurementProject.value[0].value.toString()}");
             measurementProjectSelect.value = measurementProject.value[0].key.toString();
             //
             freelancerLevelProject.value = value.results.freelancerLevel.entries.toList();
             print("my all categories are ${ freelancerLevelProject.value[0].value.toString()}");
             freelancerLevelProjectSelect.value = freelancerLevelProject.value[0].key.toString();
             //
             projectDurationProject.value = value.results.projectDuration.entries.toList();
             print("my all categories are ${ projectDurationProject.value[0].value.toString()}");
             projectDurationProjectSelect.value = projectDurationProject.value[0].key.toString();
             //
             customPriceProject.value = value.results.priceType.entries.toList();
             print("my all categories are ${ customPriceProject.value[0].value.toString()}");
             customPriceProjectSelect.value = customPriceProject.value[0].key.toString();
             //
             expirationList.value = value.results.leadExpiration.entries.toList();
             print("my all categories are ${ expirationList.value[0].value.toString()}");
             expirationSelect.value = expirationList.value[0].key.toString();
             //
             insCompanyList.value = value.results.insuranceCompany.entries.toList();
             print("my all categories are ${ insCompanyList.value[0].value.toString()}");
             insComSelect.value = insCompanyList.value[0].key.toString();
             //
             numOfStories.value = value.results.noOfStories;
             print("my all categories are ${ numOfStories.value[0].toString()}");
             numStoriesSelect.value = numOfStories.value[0].toString();
             //
             ageRoofList.value = value.results.ageOfRoof;
             print("my all ageRoofList are ${ ageRoofList.value[0].toString()}");
             ageRoodSelect.value = ageRoofList.value[0].toString();
             //
             typeOfRoofList.value = value.results.typeOfRoof.entries.toList();
             print("my all typeOfRoofList are ${ typeOfRoofList.value[0].value.toString()}");
             typeOfRoofSelect.value = typeOfRoofList.value[0].key.toString();
             languageList.value = value.results.languages.entries.toList();
             print("my all typeOfRoofList are ${ languageList.value[0].value.toString()}");
             languageSelect.value = languageList.value[0].key.toString();
             //
             propertyTypeList.value = value.results.propertyType.entries.toList();
             print("my all propertyTypeList are ${ propertyTypeList.value[0].value.toString()}");
             propertyTypeSelect.value = propertyTypeList.value[0].key.toString();
             //
             locationList.value = value.results.locations.entries.toList();
             print("my all location  are ${ locationList.value[0].value.toString()}");
             locationSelect.value = locationList.value[0].key.toString();


           });
  }

  Future<void> selectStartDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckinDate,
      firstDate: DateTime(1920, 8),
      lastDate: DateTime(2100),);
    if (picked != null && picked != selectedCheckinDate) {
      selectedCheckinDate = picked;
    }
    startDateInput.text = "${myFormat.format(selectedCheckinDate)}";
  }
  Future<void> selectEndDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedCheckoutDate,
      firstDate: DateTime(1920, 8),
      lastDate: DateTime(2100),);
    if (picked != null && picked != selectedCheckoutDate) {
      selectedCheckoutDate = picked;
    }
    endDateInput.text = "${myFormat.format(selectedCheckoutDate)}";
  }
}

class TextFieldDataEstimation {
  String productTitle;
  String cardTitle;
  String productDes;
  String productQt;
  int price;
  String unit;

  TextFieldDataEstimation({
    this.productTitle = "",
    this.cardTitle = '',
    this.productDes = '',
    this.productQt = '',
    this.price = 0,
    this.unit ='',
  });
}
